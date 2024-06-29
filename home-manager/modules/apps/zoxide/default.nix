{
  config,
  lib,
  pkgs,
  ...
}: {
  # Configure zoxide
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
