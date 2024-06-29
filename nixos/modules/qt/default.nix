{
  config,
  lib,
  pkgs,
  ...
}: {
  qt.enable = true;
  qt.platformTheme = "qt5ct";
  qt.style = "adwaita-dark";
  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };
  environment.systemPackages = with pkgs; [
    qt5.qtwayland
  ];
}
