{pkgs, ...}: {
  home.packages = with pkgs; [
    ghostty
  ];

  home.sessionVariables.TERMINAL = "ghostty";

  xdg.configFile."ghostty/config".source = ./config;
}
