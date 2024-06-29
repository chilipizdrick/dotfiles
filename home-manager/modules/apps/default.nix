{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./firefox
    ./git
    ./tmux
    ./zsh
    ./neovim
    ./alacritty
    ./zoxide
    ./oh-my-posh
  ];
}
