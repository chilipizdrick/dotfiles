{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./cursor
    ./gtk
    ./hypr
    ./mako
    ./rofi
    # ./swaync
    # ./wal
    ./waybar
    ./wlogout
  ];
}
