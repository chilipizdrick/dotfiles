{
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    package = pkgs.unstable.hyprland;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
