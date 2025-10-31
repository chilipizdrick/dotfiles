{
  inputs,
  config,
  lib,
  ...
}: {
  imports = [
    ../modules
  ];

  nixpkgs.config.allowUnfree = true;

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      keep-outputs = true;
      experimental-features = "nix-command flakes";
      nix-path = config.nix.nixPath;
      trusted-users = ["alex"];
      substituters = ["https://nix-community.cachix.org" "https://walker.cachix.org" "https://walker-git.cachix.org"];
      trusted-public-keys = ["nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="];
    };
    channel.enable = false;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  system.stateVersion = "24.05";
}
