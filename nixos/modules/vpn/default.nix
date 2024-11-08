{pkgs, ...}: {
  imports = [
    # ./wireguard
    # ./zerotier
    ./tailscale
    # ./proxychains
  ];
  # environment.systemPackages = with pkgs; [
  #   shadowsocks-rust
  # ];
}
