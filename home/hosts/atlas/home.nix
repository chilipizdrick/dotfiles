{
  pkgs,
  lib,
  scripts,
  ...
}: let
  scale = "1.666667";
in {
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
        ",preferred,auto,${scale}"
      ];
      bind = [
        "${mod} ALT, W, exec, ${scripts.setup-workflow-atlas}/bin/setup-workflow-atlas"
      ];
      env = [
        "GDK_SCALE,${scale}"
        # "GDK_DPI_SCALE,${scale}"
      ];
    };
  };

  home.sessionVariables = {
    GDK_SCALE = "${scale}";
    # GDK_DPI_SCALE = "${scale}";
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
