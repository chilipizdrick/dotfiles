{
  pkgs,
  scripts,
  ...
}: {
  imports = [
    ./alacritty
    ./carapace
    ./cava
    ./chromium
    ./command-not-found
    ./direnv
    ./discord
    ./dolphin
    ./eza
    ./fzf
    ./git
    ./helium
    ./jujutsu
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
    mpv
    obsidian
    ripdrag
    scripts.hijacker-lite
    telegram-desktop
  ];
}
