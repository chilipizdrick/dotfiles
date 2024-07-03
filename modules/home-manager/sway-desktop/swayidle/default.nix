{
  config,
  pkgs,
  lib,
  ...
}: {
  services.swayidle = let
    swaylockCommand = ''
      swaylock -f \
        --screenshots \
        --clock \
        --indicator \
        --indicator-radius 100 \
        --indicator-thickness 7 \
        --effect-blur 7x5 \
        --grace 2 \
        --fade-in 0.2
    '';
    sleepCommand = ''
      ${pkgs.systemd}/bin/systemctl suspend-then-hibernate"
    '';
  in {
    enable = true;
    # systemdTarget = "sway-session.target";
    timeouts = [
      {
        timeout = 15;
        command = swaylockCommand;
      }
      {
        timeout = 30;
        command = sleepCommand;
      }
    ];
    # events = [
    #   {
    #     event = "before-sleep";
    #     command = swaylockCommand;
    #   }
    #   {
    #     event = "lock";
    #     command = swaylockCommand;
    #   }
    # ];
  };
}
