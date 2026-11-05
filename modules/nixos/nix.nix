{
  lib,
  inputs,
  ...
}: {
  nixpkgs.config = {
    allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "b43-firmware"
        "broadcom-bt-firmware"
        "brother-udev-rule-type1"
        "brscan4"
        "brscan4-etc-files"
        "corefonts"
        "facetimehd-calibration"
        "facetimehd-firmware"
        "nvidia-x11"
        "steam"
        "steam-unwrapped"
        "xone-dongle-firmware"
      ];
  };

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
