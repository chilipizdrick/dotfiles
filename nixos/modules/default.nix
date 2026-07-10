{...}: {
  imports = [
    # ./probe-rs
    ./appimage
    ./apps
    ./boot
    ./firewall
    ./firmware
    ./fonts
    ./games
    ./hyprland
    ./locale
    ./misc
    ./nix
    # ./qt
    ./shell
    ./swap
    ./users
    ./virtualization
    ./vpn
    ./xdg-portals
  ];

  programs.kdeconnect.enable = true;
  programs.nix-ld.enable = true;
  security.polkit.enable = true;

  system.stateVersion = "26.05";
}
