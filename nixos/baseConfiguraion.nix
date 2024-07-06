{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../modules/nixos
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = "nix-command flakes";
      flake-registry = "";
      nix-path = config.nix.nixPath;
    };
    channel.enable = false;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  # Enable execution of dynamically linked binaries
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  services.xserver.enable = true;

  environment.systemPackages = with pkgs; [
    home-manager
    gcc_multi
    go
    nodejs_22
    python3
    cargo
    rustc
    php
    temurin-bin
    julia_19
    luajitPackages.luarocks
    python312Packages.pip
    php83Packages.composer
    ripgrep
    wget
    jq
    git
    zip
    unzip
    gzip
    vim
    wlr-randr
    docker
    hyprland
    alacritty
    tmux
    htop
    btop
    gparted
  ];

  # Remove XTerm
  services.xserver.excludePackages = [pkgs.xterm];
  services.xserver.desktopManager.xterm.enable = false;

  # Setup zsh
  programs.zsh.enable = true;

  users.users = {
    alex = {
      initialPassword = "password";
      isNormalUser = true;
      # openssh.authorizedKeys.keys = [];
      extraGroups = ["admin" "networkmanager" "wheel" "audio" "docker" "video"];
      shell = pkgs.zsh;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
