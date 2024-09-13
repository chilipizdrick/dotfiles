{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.amdVideoDrivers;
in {
  options.amdVideoDrivers.enable = mkEnableOption "AMD video drivers";
  config = mkIf cfg.enable {
    services.xserver.videoDrivers = lib.mkDefault ["modesetting"];
    hardware.amdgpu.initrd.enable = lib.mkDefault true;
    hardware.opengl.enable = true;
    hardware.opengl.driSupport32Bit = true;
  };
}
