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
      # flake-registry = "";
      nix-path = config.nix.nixPath;
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
    channel.enable = false;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  # Enable execution of dynamically linked binaries
  programs.nix-ld = {
    enable = true;
    libraries = [];
  };

  services.xserver.enable = true;

  environment.systemPackages = with pkgs; [
    unstable.home-manager

    unstable.xwayland

    gcc_multi
    unstable.go
    # nodejs_22
    unstable.python3
    # cargo
    # rustc
    # php
    # temurin-bin
    # temurin-bin-17
    temurin-bin-8
    unstable.julia_19
    luajitPackages.luarocks
    # python312Packages.pip
    # php83Packages.composer

    ripgrep
    wget
    curl
    jq
    git
    zip
    unzip
    gzip
    vim
    fzf

    unstable.alacritty
    unstable.tmux
    unstable.tmux-sessionizer
    unstable.btop
    unstable.fastfetch
    unstable.alejandra
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
      extraGroups = ["admin" "networkmanager" "wheel" "audio" "docker" "video" "dialout" "scanner" "lp" "uinput"];
      shell = pkgs.zsh;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
