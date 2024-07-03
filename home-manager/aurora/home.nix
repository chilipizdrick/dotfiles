{...}: {
  imports = [
    ../baseHome.nix
  ];
  wayland.windowManager.hyprland = {
    settings.monitor = [
      ",preferred,auto,auto"
      "Unknown-1,disable"
      "DP-3,1920x1080@75,0x0,auto"
      "HDMI-A-1,preferred,1920x0,auto"
    ];
  };
}
