{
  pkgs,
  config,
  ...
}: {
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    powerManagement.enable = true;
    open = true;
    nvidiaSettings = false;
    package = (pkgs.linuxPackagesFor config.boot.kernelPackages.kernel).nvidiaPackages.stable;
  };
  boot.kernelParams = ["nvidia.NVreg_PreserveVideoMemoryAllocations=1"]; # For correct suspention and hibernation
}
