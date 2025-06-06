{pkgs, ...}: {
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "loginctl lock-session";
      }
      {
        event = "after-resume";
        command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
      }
      {
        event = "lock";
        command = "${pkgs.hyprlock}/bin/hyprlock &";
      }
    ];
    timeouts = [
      {
        timeout = 15;
        command = "loginctl lock-session";
      }
      {
        timeout = 30;
        command = "systemctl suspend";
      }
    ];
  };
}
