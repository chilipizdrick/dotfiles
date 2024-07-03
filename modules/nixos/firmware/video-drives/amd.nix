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
    services.xserver.videoDrivers = ["amdgpu"];
    hardware.opengl.driSupport32Bit = true;
    hardware.opengl.extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };
}
