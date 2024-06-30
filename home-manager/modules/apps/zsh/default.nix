{
  config,
  lib,
  pkgs,
  ...
}: {
  # Configure z-shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      fastfetch
    '';
  };
  home.packages = [pkgs.fastfetch];
}
