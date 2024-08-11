{pkgs, ...}: {
  programs.wlogout = {
    enable = true;
    package = pkgs.unstable.wlogout;
  };
  home.file.".config/wlogout".source = ./config;
}
