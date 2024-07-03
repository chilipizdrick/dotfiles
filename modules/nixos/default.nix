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
    ./locale
    ./misc
    ./polkit
    ./qt
    ./sudo
    ./vpn
    ./xdg-portals
  ];
}
