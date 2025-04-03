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

  nixpkgs.config.allowUnfreePredicate = let
    whitelist = map lib.getName [
      pkgs.steam
      pkgs.steam-unwrapped
      pkgs.corefonts
      pkgs.zerotierone
    ];
  in
    pkg: builtins.elem (lib.getName pkg) whitelist;

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
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
