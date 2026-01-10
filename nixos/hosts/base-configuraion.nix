{
  inputs,
  config,
  lib,
  ...
}: {
  imports = [
    ../modules
  ];

  nixpkgs = {
    config.allowUnfree = true;
  };

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
      substituters = ["https://nix-community.cachix.org" "https://chilipizdrick.cachix.org" "https://attic.xuyh0120.win/lantian"];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "chilipizdrick.cachix.org-1:xVL2Q4Rbpc6EpDJ8lNHg7BMRhPfT26jw7l+jk4taUI8="
        "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      ];
    };
    channel.enable = false;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  system.stateVersion = "24.05";
}
