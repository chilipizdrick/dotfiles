{pkgs, ...}: {
  gtk = {
    enable = true;

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    iconTheme = {
      name = "kora";
      package = pkgs.kora-icon-theme;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    "org/gnome/desktop/media-handling" = {
      automount = false;
      automount-open = false;
      autorun-never = true;
    };
    "org/gnome/desktop/default-applications/terminal" = {
      exec = "alacritty";
      exec-arg = "-e";
    };
  };
}
