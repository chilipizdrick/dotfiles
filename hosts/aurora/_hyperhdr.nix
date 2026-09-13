{pkgs, ...}: {
  systemd.user.services.hyperhdr = {
    description = "HyperHDR Ambient Lighting Service";
    partOf = ["graphical-session.target"];
    after = [
      "graphical-session.target"
      "pipewire.service"
    ];
    wants = ["pipewire.service"];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.hyperhdr}/bin/hyperhdr";
      Restart = "on-failure";
      RestartSec = "3s";
      TimeoutStopSec = "10s";
    };

    wantedBy = ["graphical-session.target"];
  };

  systemd.services.restart-hyperhdr-on-resume = {
    description = "Restart HyperHDR After Resume";
    after = ["suspend.target" "hibernate.target" "hybrid-sleep.target"];
    wantedBy = ["suspend.target" "hibernate.target" "hybrid-sleep.target"];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.systemd}/bin/systemctl --user --machine=alex@ restart hyperhdr.service";
    };
  };
}
