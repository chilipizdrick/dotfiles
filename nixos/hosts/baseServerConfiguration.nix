{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../modules/serverModules
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
      warn-dirty = false;
      experimental-features = "nix-command flakes";
      nix-path = config.nix.nixPath;
    };
    channel.enable = false;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  networking.hostName = "nl-vps";
  zramSwap.enable = true;
  boot.tmp.cleanOnBoot = true;

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
      MaxAuthTries = 3;
      LoginGraceTime = 15;
      PasswordAuthentication = false;
      PermitEmptyPasswords = "no";
      ChallengeResponseAuthentication = "no";
      KerberosAuthentication = "no";
      GSSAPIAuthentication = "no";
      X11Forwarding = false;
      PermitUserEnvironment = "no";
      AllowAgentForwarding = "no";
      AllowTcpForwarding = "no";
      PermitTunnel = "no";
    };
  };

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestions.enable = true;
      histSize = 1000;
      shellAliases = {
        ll = "ls -la";
        l = "ls -la";
        lla = "ls -lah";
      };
    };
  };

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [22 80 2633];
    };
  };

  time.timeZone = "Europe/Amsterdam";

  users.users = let
    sshKeys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJOxfYfqKgUPvArW2fOl3KI/nbYODPrDslypy0xstULp alex@nixos"];
  in {
    "root" = {
      openssh.authorizedKeys.keys = sshKeys;
      shell = pkgs.zsh;
    };
    "vps" = {
      initialPassword = "password";
      isNormalUser = true;
      extraGroups = ["admin" "wheel" "docker" "users" "systemd-journal" "networkmanager"];
      openssh.authorizedKeys.keys = sshKeys;
      shell = pkgs.zsh;
    };
  };

  environment.systemPackages = with pkgs; [
    curl
    git
    zip
    unzip
    vim
    tmux
    tmux-sessionizer
    btop
  ];

  system.stateVersion = "23.11";
}
