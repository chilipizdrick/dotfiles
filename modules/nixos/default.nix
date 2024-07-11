{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./bootloader
    ./dconf
    ./firmware
    ./fonts
    ./greeter
    ./hyperion
    ./locale
    ./misc
    ./polkit
    ./qt
    ./sudo
    ./swap
    ./vpn
    ./xdg-portals
  ];
}
