{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ../baseHome.nix
  ];
  services.hypridle.settings.listener = lib.mkForce [
    {
      timeout = 600;
      on-timeout = "hyprlock";
    }
    {
      timeout = 900;
      on-timeout = "systemctl suspend";
    }
  ];

  hyprlock = {
    enable = true;
    scale = 1.5;
  };

  wayland.windowManager.hyprland = {
    package = lib.mkForce pkgs.hyprland; # Hyprland 0.42.0+ does not work on this machine for some reason
    # package = lib.mkForce inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland-legacy-renderer;
    settings = {
      monitor = lib.mkForce [
        ",preferred,auto,1.666667"
      ];
    };
  };

  games = {
    enable = true;
    minecraft = true;
  };
}
