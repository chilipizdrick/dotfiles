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
    package = lib.mkForce pkgs.hyprland;
    settings = {
      monitor = lib.mkForce [
        ",preferred,auto,1.666667"
        # ",preferred,auto,1"
      ];
      bind = [
        "$mainMod, bracketleft, exec, hyprctl keyword monitor \",auto,auto,1\""
        "$mainMod, bracketright, exec, hyprctl keyword monitor \",auto,auto,1.666667\""
      ];
    };
  };

  games = {
    enable = true;
    minecraft = true;
  };
}
