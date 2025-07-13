{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../modules
  ];

  nixpkgs = let
    inherit (lib.trivial) const;
    nixPackage = config.nix.package; # Lix
  in {
    overlays = [
      (const (prev: {
        nixos-rebuild = prev.nixos-rebuild.override {
          nix = nixPackage;
        };
        nix-direnv = prev.nix-direnv.override {
          nix = nixPackage;
        };
        nix-index = prev.nix-index.override {
          nix = nixPackage;
        };
      }))
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    package = pkgs.lix;
    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      keep-outputs = true;
      experimental-features = "nix-command flakes";
      nix-path = config.nix.nixPath;
      trusted-users = ["alex"];
      substituters = ["https://nix-community.cachix.org"];
      trusted-public-keys = ["nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="];
    };
    channel.enable = false;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  system.stateVersion = "24.05";
}
