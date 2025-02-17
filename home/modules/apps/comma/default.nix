{
  inputs,
  lib,
  ...
}: {
  imports = [inputs.nix-index-database.hmModules.nix-index];

  programs.nix-index-database.comma.enable = true;
  programs.nix-index = {
    enable = true;
    symlinkToCacheHome = true;
  };
  programs.command-not-found = {
    enable = lib.mkForce false;
  };
  programs.nix-index.enableBashIntegration = lib.mkForce false;
  programs.nix-index.enableZshIntegration = lib.mkForce false;
}
