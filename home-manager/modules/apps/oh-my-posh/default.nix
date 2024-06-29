{
  config,
  lib,
  pkgs,
  ...
}: {
  # Configure oh-my-posh
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile ./config.json));
  };
}
