{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../base-home.nix
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

  wayland.windowManager.hyprland = let
    mod = "SUPER";
  in {
    settings = {
      monitor = lib.mkForce [
        ",preferred,auto,1.666667"
      ];
      bind = [
        "${mod}, bracketleft, exec, hyprctl keyword monitor \",auto,auto,1\" && swww restore"
        "${mod}, bracketright, exec, hyprctl keyword monitor \",auto,auto,1.666667\" && swww restore"
        "${mod} ALT, W, exec, ${pkgs.scripts.setup-workflow-atlas}/bin/setup-workflow-atlas"
      ];
    };
  };

  games = {
    enable = true;
    minecraft = true;
    heroic = false;
    r2modman = true;
  };

  home.packages = with pkgs; [
    mathematica
  ];
}
