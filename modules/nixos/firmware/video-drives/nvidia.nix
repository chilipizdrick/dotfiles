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
      nvidiaSettings = true;
      package = (pkgs.unstable.linuxPackagesFor config.boot.kernelPackages.kernel).nvidiaPackages.beta;
      # package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      #   version = "560.28.03";
      #
      #   sha256_64bit = "sha256-martv18vngYBJw1IFUCAaYr+uc65KtlHAMdLMdtQJ+Y=";
      #   sha256_aarch64 = lib.fakeSha256;
      #   openSha256 = lib.fakeSha256;
      #   settingsSha256 = "sha256-b4nhUMCzZc3VANnNb0rmcEH6H7SK2D5eZIplgPV59c8=";
      #   persistencedSha256 = lib.fakeSha256;
      # };
    };
    boot.kernelParams = ["nvidia.NVreg_PreserveVideoMemoryAllocations=1"]; # For correct suspention and hibernation
    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };
}
