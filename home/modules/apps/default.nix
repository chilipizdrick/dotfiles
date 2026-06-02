{
  pkgs,
  inputs',
  ...
}: {
  imports = [
    # ./dolphin
    ./alacritty
    ./carapace
    ./cava
    ./chromium
    ./command-not-found
    ./direnv
    ./discord
    ./eza
    ./fzf
    ./git
    ./helium
    ./jujutsu
    ./mpv
    ./neovim
    ./obs-studio
    ./shells
    ./spotify
    ./starship
    ./tmux
    ./udiskie
    ./zathura
    ./zen
    ./zoxide
    ./kdeconnect
    # ./helix
  ];

  home.packages = with pkgs; [
    # bitwarden-desktop
    # gdbgui
    # helvum
    # opencode
    # scripts.hijacker-lite
    # syncplay
    # vscode
    ani-cli
    audacity
    baobab
    coppwr
    decibels
    easyeffects
    imv
    inputs'.hijacker2.packages.hijacker2
    kdePackages.kolourpaint
    loupe
    obsidian
    qbittorrent
    ripdrag
    telegram-desktop
    vlc
    yt-dlp
  ];
}
