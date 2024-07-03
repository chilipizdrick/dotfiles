{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./audio
    ./bluetooth
    ./bootloader
    ./dconf
    ./firmware
    ./fonts
    ./greeter
    ./locale
    ./polkit
    ./power-management
    ./sudo
    ./tablet
    ./time
    ./vpn
    ./xdg
  ];
}
