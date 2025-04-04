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
      open = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      nvidiaSettings = true;
      package = (pkgs.linuxPackagesFor config.boot.kernelPackages.kernel).nvidiaPackages.stable;
    };
    boot.kernelParams = ["nvidia.NVreg_PreserveVideoMemoryAllocations=1"]; # For correct suspention and hibernation
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
