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
    ./hyperion
    ./hyprland-desktop
  ];
}
