{pkgs, ...}: {
  qt = {
    enable = true;
    platformTheme = "kde6";
    style = "breeze";
  };

  environment.systemPackages = with pkgs; [
    qt5.qtwayland
    qt6.qtwayland
  ];
}
