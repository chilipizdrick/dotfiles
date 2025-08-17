{
  inputs',
  pkgs,
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
    ./kdeconnect
    ./neovim
    ./obs-studio
    ./shells
    ./spotify
    ./starship
    ./tmux
    ./udiskie
    ./yazi
    ./zathura
    ./zen
    ./zoxide
  ];

  home.packages = with pkgs; [
    ani-cli
    baobab
    decibels
    helvum
    imv
    gimp3
    krita
    loupe
    mpv
    obsidian
    telegram-desktop
    thunderbird
    inputs'.hijacker.packages.default
  ];
}
