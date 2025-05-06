{pkgs, ...}: {
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
    ./zen
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
    openvpn
    telegram-desktop
    thunderbird
    code-cursor
  ];
}
