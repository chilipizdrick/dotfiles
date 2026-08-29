{...}: {
  programs.alacritty.enable = true;

  xdg.configFile."alacritty/alacritty.toml".source = ./config.toml;
  home.sessionVariables.TERMINAL = "alacritty";
}
