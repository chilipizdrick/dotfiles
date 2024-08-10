{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      # name = "adw-gtk3-dark";
      # package = pkgs.adw-gtk3;

      name = "Orchis-Dark";
      package = pkgs.orchis-theme;
    };
    iconTheme = {
      name = "Flat-Remix-Blue-Dark";
      package = pkgs.flat-remix-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 20;
    };
  };
}
