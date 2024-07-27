{
  config,
  pkgs,
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
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = (pkgs.unstable.linuxPackagesFor config.boot.kernelPackages.kernel).nvidiaPackages.beta;
    };
    boot.kernelParams = ["nvidia.NVreg_PreserveVideoMemoryAllocations=1"]; # For correct suspention and hibernation
    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };
}
