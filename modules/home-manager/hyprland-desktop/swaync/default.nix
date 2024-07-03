{...}: {
  services.swaync.enable = true;
  home.file.".config/swaync".source = ./config;
}
