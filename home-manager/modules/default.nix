{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # ./sway-desktop
    ./hyprland-desktop
    ./apps
    ./fonts
    # ./games
    ./aliases
  ];
}
