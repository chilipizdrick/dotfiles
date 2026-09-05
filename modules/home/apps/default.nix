{
  pkgs,
  inputs',
  self',
  ...
}: {
  services.tailscale-systray.enable = true;

  programs.carapace.enable = true;
  programs.command-not-found.enable = false;
  programs.eza.enable = true;
  programs.fzf.enable = true;

  home.packages = with pkgs; [
    audacity
    baobab
    coppwr
    decibels
    discord
    easyeffects
    imv
    inputs'.hijacker2.packages.hijacker2
    kdePackages.kolourpaint
    loupe
    obsidian
    onlyoffice-desktopeditors
    qbittorrent
    ripdrag
    self'.packages.helium-browser
    spotify
    telegram-desktop
    vlc
  ];
}
