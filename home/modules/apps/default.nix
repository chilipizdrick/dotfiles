{
  inputs',
  pkgs,
  ...
}: {
  imports = [
    # ./alacritty
    # ./firefox
    # ./helix
    # ./nushell
    ./carapace
    ./cava
    ./chromium
    ./command-not-found
    ./direnv
    ./discord
    ./fish
    ./fzf
    ./ghostty
    ./git
    ./kdeconnect
    ./neovim
    ./obs-studio
    ./spotify
    ./starship
    ./tmux
    ./udiskie
    ./yazi
    ./zathura
    ./zen
    ./zoxide
    ./zsh
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
