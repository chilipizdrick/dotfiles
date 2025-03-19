{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # ./firefox
    # ./flatpak
    ./alacritty
    ./carapace
    ./cava
    ./chromium
    ./direnv
    ./discord
    ./fzf
    ./ghostty
    ./git
    ./helix
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
    affine
    ani-cli
    baobab
    decibels
    gimp
    helvum
    imv
    inputs.zen-browser.packages."${system}".twilight
    loupe
    mpv
    obsidian
    openvpn
    telegram-desktop
    thunderbird
    zathura
  ];
}
