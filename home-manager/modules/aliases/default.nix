{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.customAliases;
in {
  # options = {
  #   customAliases.enable = lib.mkEnableOption "Wether to enable cusom aliases";
  # };
  #
  # config = lib.mkIf cfg.enable {
  #   # Set shell aliases
  #   home.shellAliases = {
  #     ll = "ls -la";
  #     gadd = "git add .";
  #     # tmux is picky with teminal colors
  #     tmux = "TERM=xterm-256color tmux -u";
  #     vi = "nvim";
  #     vim = "nvim";
  #   };
  # };
  home.shellAliases = {
    ll = "ls -la";
    gadd = "git add .";
    gacp = "git add . && git commit -m $1 && git push";
    # tmux is picky with teminal colors
    tmux = "TERM=tmux-256color tmux -u";
    # vi = "nvim";
    # vim = "nvim";
  };
}
