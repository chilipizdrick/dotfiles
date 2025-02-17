{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (comma.override {nix-index-unwrapped = config.programs.nix-index.package;})
    television
    inputs.nix-search-tv.packages."${system}".default
  ];
  programs.nix-index.enable = true;
  programs.command-not-found = {
    enable = lib.mkForce false;
  };
  programs.nix-index.enableBashIntegration = lib.mkForce false;
  programs.nix-index.enableZshIntegration = lib.mkForce false;
}
