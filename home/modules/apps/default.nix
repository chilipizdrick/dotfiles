{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # ./firefox
    # ./helix
    ./alacritty
    ./carapace
    ./cava
    ./chromium
    ./direnv
    ./discord
    ./fzf
    ./ghostty
    ./git
    ./neovim
    ./nushell
    ./obs-studio
    ./spotify
    ./starship
    ./tmux
    ./udiskie
    ./yazi
    ./zoxide
    ./zsh
  ];

  home.packages = with pkgs; [
    ani-cli
    baobab
    decibels
    gimp
    helvum
    imv
    inputs.zen-browser.packages."${system}".default
    loupe
    mpv
    obsidian
    openvpn
    telegram-desktop
    thunderbird
    zathura
  ];
}
