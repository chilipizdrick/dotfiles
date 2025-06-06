{pkgs, ...}: {
  services.hypridle = {
    enable = true;
    package = pkgs.hypridle;
    settings = {
      general = {
        before_sleep_cmd = "loginctl lock-session"; # Lock before suspend.
        after_sleep_cmd = "hyprctl dispatch dpms on"; # Avoid having to press a key twice to turn on the display.
        ignore_dbus_inhibit = false; # Whether to ignore dbus-sent idle-inhibit requests (used by e.g. firefox or steam)
        lock_cmd = "pidof hyprlock || hyprlock"; # Avoid starting multiple hyprlock instances.
      };
      listener = [
        {
          timeout = 600;
          on-timeout = "${pkgs.hyprlock}/bin/hyprlock";
        }
        {
          timeout = 900;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
