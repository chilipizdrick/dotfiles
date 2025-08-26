{
  lib,
  pkgs,
  scripts,
  ...
}: {
  imports = [
    ../base-home.nix
  ];

  services.hypridle.settings.listener = lib.mkForce [
    {
      timeout = 3600;
      on-timeout = "${pkgs.hyprlock}/bin/hyprlock";
    }
    {
      timeout = 7200;
      on-timeout = "systemctl suspend";
    }
  ];

  hyprlock = {
    enable = true;
    scale = 1.0;
  };

  wayland.windowManager.hyprland = let
    mod = "SUPER";
  in {
    settings = {
      monitor = lib.mkForce [
        ",preferred,auto,auto"
        "Unknown-1,disable"
        "DP-3,1920x1080@75, 0x0,1"
        "HDMI-A-1,1920x1080@60,1920x0,1"
      ];

      workspace = [
        "10,monitor:DP-3,border:false"
        "1,monitor:HDMI-A-1"
        "2,monitor:HDMI-A-1"
        "3,monitor:HDMI-A-1"
        "4,monitor:HDMI-A-1"
        "5,monitor:HDMI-A-1"
        "6,monitor:HDMI-A-1"
        "7,monitor:HDMI-A-1"
        "8,monitor:HDMI-A-1"
        "9,monitor:HDMI-A-1"
      ];

      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "NVD_BACKEND,direct"
      ];

      bind = [
        "${mod} ALT,W,exec,${scripts.setup-workflow-aurora}/bin/setup-workflow-aurora"
      ];
    };
  };

  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
  };

  # hyperion.enable = true;

  games = {
    enable = true;
    minecraft = true;
    r2modman = true;
    heroic = false;
  };
}
