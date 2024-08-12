{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    package = pkgs.unstable.waybar;
  };
  home.file.".config/waybar/config".source = ./config/config;
  home.file.".config/waybar/style.css".source = ./config/style.css;
  home.file.".config/waybar/colors.css".source = ./config/colors.css;
  home.file.".config/waybar/scripts".source = ./config/scripts;
  home.packages = [pkgs.unstable.pavucontrol];
}
