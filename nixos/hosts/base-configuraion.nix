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

  nixpkgs = {
    overlays = [
      (final: _prev: import ../../pkgs pkgs)
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

  programs.nix-ld = {
    enable = true;
    libraries = [];
  };

  environment.systemPackages = with pkgs; [
    home-manager

    ripgrep
    wget
    curl
    jq
    git
    zip
    unzip
    gzip
    neovim
    fzf

    tmux
    tmux-sessionizer
    btop
    fastfetch
    alejandra

    sops
    poetry
    docker
    docker-compose
  ];

  programs.zsh.enable = true;
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
