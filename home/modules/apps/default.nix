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
    ./zathura
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
    inputs.zen-browser.packages.${system}.twilight
    loupe
    mpv
    obsidian
    openvpn
    telegram-desktop
    thunderbird
  ];
}
