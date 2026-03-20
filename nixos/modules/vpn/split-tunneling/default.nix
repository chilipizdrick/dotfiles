{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.services.splitTunneling;
in {
  options.services.splitTunneling = {
    enable = lib.mkEnableOption "User-based split tunneling (bypass Tailscale)";

    user = lib.mkOption {
      type = lib.types.str;
      default = "novpn";
      description = "User whose traffic bypasses Tailscale";
    };

    tableId = lib.mkOption {
      type = lib.types.int;
      default = 200;
      description = "Routing table ID";
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.user} = {
      isNormalUser = true;
      description = "Split tunnel bypass user";
    };

    environment.etc."iproute2/rt_tables".text = ''
      255 local
      254 main
      253 default
      0 unspec
      ${toString cfg.tableId} novpn
    '';

    networking.firewall.enable = true;

    systemd.services.splitTunnelSetup = {
      description = "Split tunneling setup (auto gateway detection)";

      after = ["network-online.target" "tailscaled.service"];
      wants = ["network-online.target"];

      wantedBy = ["multi-user.target"];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };

      script = ''
        set -euo pipefail

        echo "[splitTunnel] Detecting default route..."

        # Extract default route info
        DEFAULT_ROUTE=$(${pkgs.iproute2}/bin/ip route show default | head -n1)

        if [ -z "$DEFAULT_ROUTE" ]; then
          echo "[splitTunnel] ERROR: No default route found"
          exit 1
        fi

        GATEWAY=$(echo "$DEFAULT_ROUTE" | ${pkgs.gawk}/bin/awk '{print $3}')
        IFACE=$(echo "$DEFAULT_ROUTE" | ${pkgs.gawk}/bin/awk '{print $5}')

        echo "[splitTunnel] Gateway: $GATEWAY"
        echo "[splitTunnel] Interface: $IFACE"

        # Add route to custom table (idempotent)
        ${pkgs.iproute2}/bin/ip route show table ${toString cfg.tableId} | grep -q default || \
          ${pkgs.iproute2}/bin/ip route add default via "$GATEWAY" dev "$IFACE" table ${toString cfg.tableId}

        # Add iptables mark rule (if missing)
        ${pkgs.iptables}/bin/iptables -t mangle -C OUTPUT -m owner --uid-owner ${cfg.user} -j MARK --set-mark 1 2>/dev/null || \
          ${pkgs.iptables}/bin/iptables -t mangle -A OUTPUT -m owner --uid-owner ${cfg.user} -j MARK --set-mark 1

        # Add policy routing rule (if missing)
        ${pkgs.iproute2}/bin/ip rule show | grep -q "fwmark 1.*${toString cfg.tableId}" || \
        ${pkgs.iproute2}/bin/ip rule add fwmark 1 table ${toString cfg.tableId}

        echo "[splitTunnel] Setup complete"
      '';
    };
  };
}
