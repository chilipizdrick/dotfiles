{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.swapFile;
in {
  options.swapFile = {
    enable = mkEnableOption "Enable swap file";
    size = mkOption {
      type = types.int;
      default = 16;
      example = 8;
      description = "Size of swap file in GiB";
    };
  };
  config = mkIf cfg.enable {
    swapDevices = [
      {
        device = "/var/lib/swapfile";
        size = cfg.size * 1024;
      }
    ];
  };
}
