{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.printerScanner;
in {
  options.printerScanner.enable = mkEnableOption "Printer and scanner config";

  config = mkIf cfg.enable {
    services.printing.enable = true;
    services.printing.drivers = with pkgs; [brlaser];
    environment.systemPackages = with pkgs; [simple-scan];

    hardware.sane = {
      enable = true;
      brscan4.enable = true;
      disabledDefaultBackends = ["v4l"];
    };
  };
}
