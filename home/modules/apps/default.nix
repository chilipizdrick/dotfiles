{
  inputs',
  pkgs,
  ...
}: {
  imports = [
    # ./alacritty
    # ./firefox
    # ./helix
    ./carapace
    ./cava
    ./chromium
    ./command-not-found
    ./direnv
    ./discord
    ./eza
    ./fzf
    ./ghostty
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
    loupe
    mpv
    obsidian
    telegram-desktop
    thunderbird
    inputs'.hijacker.packages.default
  ];
}
