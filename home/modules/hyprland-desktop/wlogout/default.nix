{...}: {
  programs.wlogout.enable = true;

  xdg.configFile."wlogout".source = ./config;
}
