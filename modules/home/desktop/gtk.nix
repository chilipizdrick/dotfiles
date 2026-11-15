{pkgs, ...}: {
  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;

    iconTheme = {
      name = "kora";
      package = pkgs.kora-icon-theme;
    };
  };
}
