{
  pkgs,
  inputs',
  self',
  ...
}: {
  imports = [
    ./alacritty
    ./direnv
    ./git
    ./jujutsu
    # ./kdeconnect
    ./mpv
    ./neovim
    ./obs-studio
    ./shells
    ./starship
    ./tmux
    ./udiskie
    ./zathura
    ./zoxide
  ];

  services.tailscale-systray.enable = true;

  programs.carapace.enable = true;
  programs.command-not-found.enable = false;
  programs.eza.enable = true;
  programs.fzf.enable = true;

  home.packages = with pkgs; [
    ani-cli
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
    reaper
    ripdrag
    self'.packages.helium-browser
    spotify
    telegram-desktop
    vlc
    yt-dlp
  ];
}
