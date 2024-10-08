{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };
  home.file.".config/waybar/config".source = ./config/config;
  home.file.".config/waybar/style.css".source = ./config/style.css;
  home.file.".config/waybar/catppuccin-mocha.css".source = ./config/catppuccin-mocha.css;
  home.file.".config/waybar/scripts".source = ./config/scripts;
  home.packages = [pkgs.pavucontrol];
}
