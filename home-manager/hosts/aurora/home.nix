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
      timeout = 3600;
      on-timeout = "hyprlock";
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

  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        ",preferred,auto,auto"
        "Unknown-1,disable"
        "DP-3,1920x1080@75,0x0,auto"
        "HDMI-A-1,preferred,1920x0,auto"
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
    };
  };

  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
  };

  # Enable ambilight support
  hyperion.enable = true;

  games = {
    enable = true;
    minecraft = true;
    # osu = true;
    r2modman = true;
  };

  home.packages = with pkgs; [
    obs-studio
  ];
}
