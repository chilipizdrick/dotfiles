{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    # ./firefox
    # ./helix
    # ./alacritty
    ./carapace
    ./cava
    ./chromium
    ./direnv
    ./discord
    ./fzf
    ./ghostty
    ./git
    ./neovim
    # ./nushell
    ./obs-studio
    ./spotify
    ./starship
    ./tmux
    ./udiskie
    ./yazi
    ./zathura
    ./zoxide
    ./zsh
    ./zen
    ./fish
    ./command-not-found
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
    element-desktop
    inputs.hijacker.packages.${system}.default
  ];
}
