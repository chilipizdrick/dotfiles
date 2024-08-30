{
  pkgs,
  inputs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    # package = pkgs.hyprland;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };
}
