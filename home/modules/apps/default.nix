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
    ./kdeconnect
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

  programs.carapace.enable = true;
  programs.command-not-found.enable = false;
  programs.eza.enable = true;
  programs.fzf.enable = true;

  home.packages = with pkgs; [
    zed-editor-fhs
    discord
    ani-cli
    audacity
    baobab
    coppwr
    decibels
    easyeffects
    imv
    inputs'.hijacker2.packages.hijacker2
    inputs'.zen-browser.packages.beta
    kdePackages.kolourpaint
    loupe
    obsidian
    opencode
    qbittorrent
    ripdrag
    self'.packages.helium-browser
    spotify
    telegram-desktop
    vlc
    yt-dlp
  ];

  xdg.desktopEntries.spotify = {
    name = "Spotify";
    genericName = "Music Player";
    exec = "spotify --enable-features=UseOzonePlatform --ozone-platform=wayland %U";
    icon = "spotify-client";
    type = "Application";
    categories = ["Audio" "Music" "Player" "AudioVideo"];
  };
}
