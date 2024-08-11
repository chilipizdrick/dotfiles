{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.hyperion;
in {
  options.hyperion.enable = mkEnableOption "Hyperion ambilight daemon";
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      unstable.hyperion-ng
      unstable.wf-recorder
      ffmpeg
      v4l-utils
    ];
    boot.extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];
    boot.kernelModules = ["v4l2loopback"];
    boot.extraModprobeConfig = ''
      options v4l2loopback exclusive_caps=1 card_label=VirtualVideoDevice
    '';
  };
}
