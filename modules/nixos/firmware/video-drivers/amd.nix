{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.amdVideoDrivers;
in {
  options.amdVideoDrivers.enable = mkEnableOption "amd video drivers";

  config = mkIf cfg.enable {
    services.xserver.videoDrivers = mkDefault ["modesetting"];
    hardware.amdgpu.initrd.enable = mkDefault true;
    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
  };
}
