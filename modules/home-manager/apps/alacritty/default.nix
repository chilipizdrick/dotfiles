{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
  };
  home.file.".config/alacritty/alacritty.toml".source = ./config/alacritty.toml;
}
