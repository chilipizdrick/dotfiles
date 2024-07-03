{
  config,
  pkgs,
  lib,
  ...
}: {
  # Configure rofi
  programs.rofi = {
    package = pkgs.rofi-wayland;
    enable = true;
    font = "JetBrainsMono Nerd Font 16";
    terminal = "${pkgs.alacritty}/bin/alacritty";
    # theme = ./themes/rounded-gray-dark.rasi;
    # theme = ./themes/transparent-dark.rasi;
    extraConfig = {
      modi = "combi,drun,run,ssh,window";
    };
  };
}
