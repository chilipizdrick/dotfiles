{
  config,
  pkgs,
  lib,
  ...
}: {
  # Configure gtk theme
  gtk = {
    enable = true;
    theme = {
      # name = "rose-pine";
      # package = pkgs.rose-pine-gtk-theme;

      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
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
