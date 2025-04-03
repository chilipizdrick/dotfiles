{pkgs, ...}: {
  services.swayidle = {
    package = pkgs.swayidle;
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "\"hyprlock\"";
      }
      {
        event = "lock";
        command = "\"hyprlock\"";
      }
      {
        event = "after-resume";
        command = "\"hyprctl dispatch dpms on\"";
      }
    ];
    timeouts = [
      {
        timeout = 600;
        command = "\"hyprlock\"";
      }
      {
        timeout = 900;
        command = "\"systemctl suspend\"";
      }
    ];
  };

  # systemd.user.services.swayidle.serviceConfig.Restart = lib.mkForce "no"; # Dissable restarting swayidle service
}
