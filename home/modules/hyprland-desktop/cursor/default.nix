{pkgs, ...}: {
  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 20;

    gtk.enable = true;
    hyprcursor.enable = true;
    # x11.enable = true;
  };
}
