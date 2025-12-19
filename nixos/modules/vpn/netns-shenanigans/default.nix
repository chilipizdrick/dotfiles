# {pkgs, ...}:
# {
#   systemd.services."netns@" = {
#     description = "%I network namespace";
#     before = ["network.target"];
#     serviceConfig = {
#       Type = "oneshot";
#       RemainAfterExit = true;
#       ExecStart = "${pkgs.iproute}/bin/ip netns add %I";
#       ExecStop = "${pkgs.iproute}/bin/ip netns del %I";
#     };
#   };
#
#   systemd.services.tailscale_netns = {
#     description = "wg network interface (mullvad)";
#     bindsTo = ["netns@mullvad.service"];
#     requires = ["network-online.target"];
#     after = ["netns@mullvad.service"];
#     wantedBy = ["multi-user.target"];
#     serviceConfig = {
#       Type = "oneshot";
#       RemainAfterExit = true;
#       ExecStart = with pkgs;
#         writers.writeBash "wg-up" ''
#           set -e
#           ${iproute}/bin/ip link add wg0 type wireguard
#           ${iproute}/bin/ip link set wg0 netns mullvad
#           ${iproute}/bin/ip -n mullvad address add <IPv4 address/CIDR> dev wg0
#           ${iproute}/bin/ip -n mullvad -6 address add <IPv6 address/CIDR> dev wg0
#           ${iproute}/bin/ip netns exec mullvad \
#           ${wireguard-tools}/bin/wg setconf wg0 /path/to/wg.conf
#           ${iproute}/bin/ip -n mullvad link set wg0 up
#           ${iproute}/bin/ip -n mullvad route add default dev wg0
#           ${iproute}/bin/ip -n mullvad -6 route add default dev wg0
#         '';
#       ExecStop = with pkgs;
#         writers.writeBash "wg-down" ''
#           ${iproute}/bin/ip -n mullvad route del default dev wg0
#           ${iproute}/bin/ip -n mullvad -6 route del default dev wg0
#           ${iproute}/bin/ip -n mullvad link del wg0
#         '';
#     };
#   };
# }
{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services.tailscaleNetns;
in {
  options.services.tailscaleNetns = {
    enable = lib.mkEnableOption "Run Tailscale exit node inside a dedicated network namespace";

    namespaceName = lib.mkOption {
      type = lib.types.str;
      default = "tailscale";
      description = "Name of the network namespace (used with ip netns exec).";
    };

    exitNode = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "Tailscale exit node hostname or node ID to use inside the namespace.";
    };

    extraUpFlags = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      description = "Extra flags passed to `tailscale up` inside the namespace.";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [pkgs.iproute2 pkgs.tailscale];

    # Disable the regular tailscaled service; we manage our own instance
    services.tailscale.enable = false;

    systemd.services.tailscale-netns = {
      description = "Tailscale in network namespace ${cfg.namespaceName}";
      wantedBy = ["multi-user.target"];
      after = ["network.target"];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };

      script = with pkgs;
      #bash
        ''
          set -euo pipefail

          NS=${cfg.namespaceName}

          # Create namespace if it does not exist
          if ! ${iproute2}/bin/ip netns list | grep -q "^$NS"; then
            ${iproute2}/bin/ip netns add $NS
          fi

          HOST_IF=veth-ts-h
          NS_IF=veth-ts-n

          ${iproute2}/bin/ip link del "$HOST_IF" 2>/dev/null || true
          ${iproute2}/bin/ip netns exec "$NS" ip link del "$NS_IF" 2>/dev/null || true

          # Create fresh veth pair
          ${iproute2}/bin/ip link add "$HOST_IF" type veth peer name "$NS_IF"

          # Move namespace side
          ${iproute2}/bin/ip link set "$NS_IF" netns "$NS"


          # Host side setup
          ${iproute2}/bin/ip addr add 100.64.0.1/30 dev $HOST_IF || true
          ${iproute2}/bin/ip link set $HOST_IF up

          # Namespace side setup
          ${iproute2}/bin/ip netns exec $NS ${iproute2}/bin/ip addr add 100.64.0.2/30 dev $NS_IF || true
          ${iproute2}/bin/ip netns exec $NS ${iproute2}/bin/ip link set lo up
          ${iproute2}/bin/ip netns exec $NS ${iproute2}/bin/ip link set $NS_IF up
          ${iproute2}/bin/ip netns exec $NS ${iproute2}/bin/ip route add default via 100.64.0.1 || true

          # Enable forwarding and NAT
          ${sysctl}/bin/sysctl -w net.ipv4.ip_forward=1
          ${iptables}/bin/iptables -t nat -C POSTROUTING -s 100.64.0.2/32 -j MASQUERADE 2>/dev/null \
            || ${iptables}/bin/iptables -t nat -A POSTROUTING -s 100.64.0.2/32 -j MASQUERADE

          # Start tailscaled inside the namespace
          if ! ${iproute2}/bin/ip netns exec $NS pgrep tailscaled >/dev/null; then
            ${iproute2}/bin/ip netns exec $NS ${pkgs.tailscale}/bin/tailscaled \
              --state=/var/lib/tailscale-netns.state \
              --socket=/run/tailscale-netns.sock &
          fi

          # Bring Tailscale up
          ${iproute2}/bin/ip netns exec $NS ${pkgs.tailscale}/bin/tailscale up \
            ${lib.optionalString (cfg.exitNode != null) "--exit-node=${cfg.exitNode} --exit-node-allow-lan-access"} \
            ${lib.concatStringsSep " " cfg.extraUpFlags}
        '';
    };

    systemd.services.tailscale-netns-stop = {
      description = "Cleanup Tailscale network namespace";
      serviceConfig.Type = "oneshot";
      script = with pkgs;
      #bash
        ''
          NS=${cfg.namespaceName}
          HOST_IF=veth-ts-h

          ${iproute2}/bin/ip netns del $NS 2>/dev/null || true
          ${iproute2}/bin/ip link del $HOST_IF 2>/dev/null || true
        '';
    };
  };
}
