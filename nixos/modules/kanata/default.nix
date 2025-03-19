{pkgs, ...}: {
  environment.systemPackages = with pkgs; [kanata];
  systemd.services.kanata = {
    enable = true;
    description = "Kanata service";
    serviceConfig = {
      RestartSec = 5;
      ExecStart = "${pkgs.kanata}/bin/kanata -c ${./config/config.kdb}";
    };
    wantedBy = ["multi-user.target"];
  };

  boot.kernelModules = ["uinput"];
}
