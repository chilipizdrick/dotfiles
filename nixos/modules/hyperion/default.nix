{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.hyperion;
in {
  options.hyperion.enable = mkEnableOption "Hyperion related v4l2loopback settings";
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      ffmpeg
      v4l-utils
      wf-recorder
      hyperion-ng
    ];

    boot = {
      extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
      kernelModules = ["v4l2loopback"];
      extraModprobeConfig = ''
        options v4l2loopback exclusive_caps=1 card_label=VirtualVideoDevice
      '';
    };
  };
}
