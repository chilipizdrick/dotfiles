{
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
  };
  environment.defaultPackages = with pkgs; [
    hyprland-qtutils
  ];
}
