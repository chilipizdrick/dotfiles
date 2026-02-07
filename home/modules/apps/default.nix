{
  pkgs,
  scripts,
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
    audacity
    decibels
    helvum
    kdePackages.kolourpaint
    loupe
    obsidian
    ripdrag
    scripts.hijacker-lite
    telegram-desktop
    bitwarden-desktop
    qbittorrent
    opencode
    vlc
  ];
}
