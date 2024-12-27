{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
  };
  environment.defaultPackages = with pkgs; [
    inputs.hyprland-qtutils.packages."${system}".default
  ];
}
