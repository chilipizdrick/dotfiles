{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./firefox
    ./cava
    ./git
    ./tmux
    ./zsh
    ./neovim
    ./alacritty
    ./zoxide
    ./oh-my-posh
  ];
}
