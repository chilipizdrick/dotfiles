{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../modules
  ];

  nixpkgs = let
    inherit (lib.trivial) const;
    nixPackage = pkgs.lix;
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
      (final: prev: {
        rofi-wayland = prev.rofi-wayland.override {
          plugins = [
            (prev.rofi-calc.override {
              rofi-unwrapped = prev.rofi-wayland-unwrapped;
            })
          ];
        };
      })
    ];

    config.allowUnfree = true;
  };

  home = {
    username = "alex";
    homeDirectory = "/home/alex";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
