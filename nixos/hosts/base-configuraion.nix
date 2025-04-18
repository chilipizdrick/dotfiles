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
    whitelist = map lib.getName [
      pkgs.steam
      pkgs.steam-unwrapped
      pkgs.corefonts
      pkgs.zerotierone
      pkgs.brscan4
    ];
    whitelistPackageNames = ["nvidia-x11" "brother-udev-rule-type1" "nvidia-settings" "brscan4-etc-files"];
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
    config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) (whitelist ++ whitelistPackageNames);
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    package = pkgs.lix;
    settings = {
      warn-dirty = false;
      experimental-features = "nix-command flakes";
      nix-path = config.nix.nixPath;
      keep-outputs = true;
      trusted-users = ["alex"];
    };
    channel.enable = false;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  system.stateVersion = "24.05";
}
