{...}: {
  programs.wlogout.enable = true;
  home.file.".config/wlogout".source = ./config;
}
