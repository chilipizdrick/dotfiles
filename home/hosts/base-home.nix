{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../modules
  ];

  nixpkgs = {
    overlays = [
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

    config.allowUnfreePredicate = let
      whitelist = map lib.getName [
        pkgs.spotify
        pkgs.discord
        pkgs.obsidian
        # pkgs.mathematica
      ];
    in
      pkg: builtins.elem (lib.getName pkg) whitelist;
  };

  home = {
    username = "alex";
    homeDirectory = "/home/alex";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
