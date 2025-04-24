{pkgs, ...}: {
  home.packages = with pkgs; [
    ghostty
  ];

  xdg.configFile."ghostty/config".source = ./config;
}
