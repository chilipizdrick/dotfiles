{pkgs, ...}: {
  services.printing.enable = true;
  services.printing.drivers = [pkgs.brlaser];
  environment.systemPackages = [pkgs.simple-scan];

  hardware.sane = {
    enable = true;
    brscan4.enable = true;
    disabledDefaultBackends = ["v4l"];
  };
}
