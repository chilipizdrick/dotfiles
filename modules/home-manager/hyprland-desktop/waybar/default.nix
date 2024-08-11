{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    package = pkgs.unstable.waybar;
  };
  home.file.".config/waybar".source = ./config;
  home.packages = [pkgs.unstable.pavucontrol];
}
