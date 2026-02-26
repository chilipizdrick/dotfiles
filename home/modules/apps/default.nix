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
  ];

  home.packages = with pkgs; [
    baobab
    imv
    ani-cli
    syncplay
    audacity
    decibels
    # helvum
    coppwr
    kdePackages.kolourpaint
    loupe
    obsidian
    ripdrag
    # scripts.hijacker-lite
    inputs'.hijacker2.packages.hijacker2
    telegram-desktop
    bitwarden-desktop
    qbittorrent
    opencode
    vlc
  ];
}
