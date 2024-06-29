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
    # ./edid
    ./firmware
    ./fonts
    ./greeter
    ./locale
    ./polkit
    ./power-management
    ./sudo
    # ./sway
    ./tablet
    ./time
    ./wireguard
    ./xdg
    ./zerotier
  ];
}
