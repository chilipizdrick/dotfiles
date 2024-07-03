{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./aliases
    ./apps
    ./fonts
    # ./games
    ./hyprland-desktop
  ];
}
