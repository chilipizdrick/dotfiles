{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../baseHome.nix
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

  wayland.windowManager.hyprland = {
    settings = {
      general = {
        sensitivity = lib.mkForce 0.50; # To compensate for different sensitivity on different scaling factors
      };

      monitor = [
        ",preferred,auto,auto"
        "Unknown-1,disable"
        "DP-3,1920x1080@75,0x0,auto"
        "HDMI-A-1,preferred,1920x0,auto"
      ];

      workspace = [
        "10,monitor:DP-3"
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

  # Fixes for poorly running electron apps
  xdg.desktopEntries = {
    vesktop-x11 = {
      categories = ["Network" "InstantMessaging" "Chat"];
      exec = "env -u XDG_SESSION_TYPE vesktop %U";
      genericName = "Voice Chat";
      icon = "vesktop";
      name = "Vesktop XDG_SESSION_TYPE Override";
      type = "Application";
      settings = {
        Keywords = "discord;vencord;electron;chat";
        StartupWMClass = "Vesktop";
      };
    };
    spotify-xwayland = {
      type = "Application";
      name = "Spotify on Xwayland";
      genericName = "Music Player";
      icon = "spotify-client";
      exec = "env -u WAYLAND_DISPLAY spotify %U";
      terminal = false;
      mimeType = ["x-scheme-handler/spotify"];
      categories = ["Audio" "Music" "Player" "AudioVideo"];
      settings = {
        StartupWMClass = "spotify";
      };
    };
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
