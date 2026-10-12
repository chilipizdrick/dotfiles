{pkgs, ...}: {
  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  gtk = {
    enable = true;
    iconTheme = {
      name = "kora";
      package = pkgs.kora-icon-theme;
    };
  };
}
