{...}: {
  services.kdeconnect = {
    enable = true;
    indicator = true;
  };

  wayland.windowManager.hyprland.settings.windowrule = [
    "opacity 1,match:title ^(KDE Connect Daemon)$"
    "no_blur on,match:title ^(KDE Connect Daemon)$"
    "border_size 0,match:title ^(KDE Connect Daemon)$"
    "no_shadow on,match:title ^(KDE Connect Daemon)$"
    "no_anim on,match:title ^(KDE Connect Daemon)$"
    "no_focus on,match:title ^(KDE Connect Daemon)$"
    "suppress_event fullscreen,match:title ^(KDE Connect Daemon)$"
    "float on,match:title ^(KDE Connect Daemon)$"
    "pin on,match:title ^(KDE Connect Daemon)$"
    "min_size 2560 1600,match:title ^(KDE Connect Daemon)$"
    "move 0 0,match:title ^(KDE Connect Daemon)$"
  ];
}
