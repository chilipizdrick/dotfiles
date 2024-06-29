{
  config,
  lib,
  pkgs,
  ...
}: {
  # Configure alacritty
  programs.alacritty.enable = true;
  home.file.".config/alacritty".source = ./config;
}
