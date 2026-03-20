{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.services.splitTunneling;
in {
  users.groups.tunneled = {};

  networking.iproute2.enable = true;

  # Create a custom routing policy
  networking.localCommands =
    #bash
    ''
      # 1. Create a routing table (42) that routes through tailscale0
      # Note: Replace 'tailscale0' if your interface name is different
      ip route add default dev tailscale0 table 42

      # 2. Tell the kernel: any traffic from group 'tunneled' uses table 42
      ip rule add fwmark 0x2a table 42

      # 3. Use iptables to "mark" traffic coming from that group
      iptables -t mangle -A OUTPUT -m owner --gid-owner tunneled -j MARK --set-mark 0x2a

      # 4. Enable masquerading so the exit node accepts the packets
      iptables -t nat -A POSTROUTING -o tailscale0 -j MASQUERADE
    '';
}
