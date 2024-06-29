{
  config,
  lib,
  pkgs,
  ...
}: {
  services.swaync = {
    enable = true;
  };
  # home.file.".config/swaync".source = config.lib.file.mkOutOfStoreSymlink ./config;
  home.file.".config/swaync".source = ./config;
}
