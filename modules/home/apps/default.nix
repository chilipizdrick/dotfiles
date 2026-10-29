{
  pkgs,
  inputs',
  self',
  ...
}: {
  programs.carapace.enable = true;
  programs.command-not-found.enable = false;
  programs.eza.enable = true;
  programs.fzf.enable = true;
  programs.prismlauncher.enable = true;
  programs.zed-editor.enable = true;

  home.packages = [
    pkgs.coppwr
    pkgs.easyeffects
    pkgs.imv
    pkgs.onlyoffice-desktopeditors
    pkgs.qbittorrent
    pkgs.ripdrag
    pkgs.telegram-desktop
    pkgs.kdePackages.elisa

    inputs'.hijacker.packages.hijacker
    self'.packages.helium-browser
  ];
}
