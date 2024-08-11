{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    package = pkgs.unstable.alacritty;
  };
  home.file.".config/alacritty".source = ./config;
}
