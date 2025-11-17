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
    ./eza
    ./fzf
    ./git
    ./helium
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
    ani-cli
    audacity
    baobab
    decibels
    helvum
    imv
    kdePackages.kolourpaint
    loupe
    mpv
    obsidian
    ripdrag
    scripts.hijacker-lite
    telegram-desktop
  ];
}
