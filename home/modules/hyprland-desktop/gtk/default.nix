{pkgs, ...}: {
  gtk = {
    enable = true;

    # theme = {
    #   name = "adw-gtk3-dark";
    #   package = pkgs.adw-gtk3;
    # };

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    iconTheme = {
      name = "kora";
      package = pkgs.kora-icon-theme;
    };
  };
}
