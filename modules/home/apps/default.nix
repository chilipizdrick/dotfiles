{
  pkgs,
  inputs',
  self',
  ...
}: {
  # services.tailscale-systray.enable = true;

  programs.carapace.enable = true;
  programs.command-not-found.enable = false;
  programs.eza.enable = true;
  programs.fzf.enable = true;

  home.packages = with pkgs; let
    withVpnDesktop = self'.lib.withVpnDesktop pkgs;
  in [
    audacity
    baobab
    coppwr
    decibels
    discord
    (withVpnDesktop discord)
    easyeffects
    imv
    inputs'.hijacker2.packages.hijacker2
    kdePackages.kolourpaint
    loupe
    obsidian
    (withVpnDesktop obsidian)
    onlyoffice-desktopeditors
    qbittorrent
    (withVpnDesktop qbittorrent)
    ripdrag
    spotify
    (withVpnDesktop spotify)
    telegram-desktop
    (withVpnDesktop telegram-desktop)
    (self'.packages.helium-browser.override {withVpnDesktopFile = true;})
    # (withVpnDesktop self'.packages.helium-browser)
  ];
}
