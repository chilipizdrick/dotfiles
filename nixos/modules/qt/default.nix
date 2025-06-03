{pkgs, ...}: {
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "breeze";
  };

  environment.systemPackages = with pkgs; [
    qt5.qtwayland
    qt6.qtwayland
  ];
}
