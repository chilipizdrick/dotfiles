{...}: {
  imports = [
    ../baseHome.nix
  ];
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        ",preferred,auto,auto"
        "Unknown-1,disable"
        "DP-3,1920x1080@75,0x0,auto"
        "HDMI-A-1,preferred,1920x0,auto"
      ];
      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];
      cursor = {
        no_hardware_cursors = true;
      };
    };
  };
  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    # NVD_BACKEND = "direct";
  };
}
