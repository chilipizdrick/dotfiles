{
  pkgs,
  scripts,
  ...
}: {
  imports = [
    # ./firefox
    # ./ghostty
    # ./helix
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
    # ./kdeconnect
    ./neovim
    ./obs-studio
    ./shells
    ./spotify
    ./starship
    ./tmux
    ./udiskie
    # ./yazi
    ./zathura
    ./zen
    ./zoxide
    ./helium
  ];

  home.packages = with pkgs; [
    ripdrag
    ani-cli
    baobab
    decibels
    helvum
    imv
    loupe
    mpv
    obsidian
    telegram-desktop
    scripts.hijacker-lite
    kdePackages.kolourpaint
    audacity
  ];
}
