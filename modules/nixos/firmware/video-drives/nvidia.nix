{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.nvidiaVideoDrivers;
in {
  options.nvidiaVideoDrivers.enable = mkEnableOption "Nvidia video drivers";
  config = mkIf cfg.enable {
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };
}
