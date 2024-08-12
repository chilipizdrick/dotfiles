{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    package = pkgs.unstable.alacritty;
  };
  home.file.".config/alacritty/alacritty.toml".source = ./config/alacritty.toml;
}
