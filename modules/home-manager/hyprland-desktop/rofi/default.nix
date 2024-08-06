{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = [pkgs.rofi-calc];
    terminal = "${pkgs.alacritty}/bin/alacritty";
  };
  home.packages = with pkgs; [
    rofi-calc
  ];
  home.file.".config/rofi".source = ./config;
}
