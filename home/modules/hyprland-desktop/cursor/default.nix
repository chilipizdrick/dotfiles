{pkgs, ...}: {
  home.pointerCursor = {
    enable = true;

    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 20;

    gtk.enable = true;
    hyprcursor.enable = true;
    # x11.enable = true;
    # dotIcons.enable = true;
  };
}
