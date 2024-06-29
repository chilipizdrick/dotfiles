{
  config,
  pkgs,
  lib,
  ...
}: {
  # Configure waybar
  programs.waybar = {
    enable = true;
  };

  home.file.".config/waybar".source = ./waybar;

  # Required for audio control
  home.packages = with pkgs; [
    pavucontrol
    # material-icons
    # whitesur-icon-theme
  ];
}
