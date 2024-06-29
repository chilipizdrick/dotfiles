{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
  };
  # home.file.".config/waybar".source = config.lib.file.mkOutOfStoreSymlink ./config;
  home.file.".config/waybar".source = ./config;
  home.packages = [pkgs.pavucontrol];
}
