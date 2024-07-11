{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.swapFile;
in {
  options.swapFile.enable = mkEnableOption "Enable swap file";
  config = mkIf cfg.enable {
    swapDevices = [
      {
        device = "/var/lib/swapfile";
        size = 16 * 1024;
      }
    ];
  };
}
