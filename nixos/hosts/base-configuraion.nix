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
    overlays = import ../../overlays {};
  in {
    overlays = [
      overlays.additions
      overlays.modifications
      overlays.scripts
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      warn-dirty = false;
      experimental-features = "nix-command flakes";
      nix-path = config.nix.nixPath;
      keep-outputs = true;
    };
    channel.enable = false;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  environment.shells = [pkgs.nushell pkgs.zsh];

  users.defaultUserShell = pkgs.zsh;

  users.users = {
    alex = {
      initialPassword = "password";
      isNormalUser = true;
      extraGroups = ["admin" "networkmanager" "wheel" "audio" "docker" "video" "dialout" "scanner" "lp" "uinput" "adm" "kvm" "users" "systemd-journal"];
      # shell = pkgs.zsh;
    };
  };

  system.stateVersion = "24.05";
}
