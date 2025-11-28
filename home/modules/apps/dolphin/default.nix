{pkgs, ...}: {
  home.packages = with pkgs; [
    kdePackages.dolphin
    kdePackages.qtsvg
    kdePackages.kservice
  ];

  xdg.configFile."menus/applications.menu".source = ./applications.menu;
}
