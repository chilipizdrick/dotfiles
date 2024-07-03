{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = [pkgs.rofi-calc];
    terminal = "${pkgs.alacritty}/bin/alacritty";
  };
  home.file.".config/rofi".source = ./config;
}
