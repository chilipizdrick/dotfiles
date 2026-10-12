{
  lib,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "b43-firmware"
      "broadcom-bt-firmware"
      "corefonts"
      "facetimehd-calibration"
      "facetimehd-firmware"
      "steam"
      "steam-unwrapped"
      "xone-dongle-firmware"
    ];

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      keep-outputs = false;
      experimental-features = ["nix-command" "flakes"];
      nix-path = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
      trusted-users = ["alex"];
    };
    channel.enable = false;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
  };
}
