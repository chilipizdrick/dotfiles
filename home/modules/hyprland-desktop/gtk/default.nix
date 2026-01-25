{pkgs, ...}: {
  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
      name = "kora";
      package = pkgs.kora-icon-theme;
    };
  };
}
