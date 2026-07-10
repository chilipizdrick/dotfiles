{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.hyperion;
  captureScript = pkgs.writeShellScript "hyperion-wayland-capture" ''
    set -euo pipefail

    OUTPUT='HDMI-A-1'
    DEVICE=$(${pkgs.v4l-utils}/bin/v4l2-ctl --list-devices | ${pkgs.gawk}/bin/awk '/VirtualVideoDevice/ {getline; print $1; exit}')

    if [ -z "$DEVICE" ]; then
      echo "Error: VirtualVideoDevice not found." >&2
      exit 1
    fi

    exec ${pkgs.wf-recorder}/bin/wf-recorder \
      -c rawvideo \
      -m v4l2 \
      -x yuv420p \
      -F scale=512:288 \
      -r 30 -B 30 -D \
      -f "$DEVICE" \
      -o "$OUTPUT"
  '';
in {
  options.hyperion.enable = mkEnableOption "Hyperion related v4l2loopback settings";
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      ffmpeg
      hyperion-ng
      v4l-utils
      wf-recorder
    ];

    boot = {
      extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
      kernelModules = ["v4l2loopback"];
      extraModprobeConfig = ''
        options v4l2loopback exclusive_caps=1 card_label=VirtualVideoDevice
      '';
    };

    systemd.user.services.hyperiond = {
      description = "Hyperion Ambient Light Daemon";
      wantedBy = ["graphical-session.target"];
      partOf = ["graphical-session.target"];
      after = ["graphical-session.target"];

      serviceConfig = {
        ExecStart = "${pkgs.hyperion-ng}/bin/hyperiond --desktop";
        Restart = "on-failure";
        RestartSec = "3s";
      };
    };

    systemd.user.services.hyperion-capture = {
      description = "Hyperion Wayland Screen Capture";
      wantedBy = ["graphical-session.target"];
      partOf = ["graphical-session.target"];
      after = ["graphical-session.target" "hyperiond.service"];

      serviceConfig = {
        ExecStart = "${captureScript}";
        Restart = "on-failure";
        RestartSec = "5s";
        # Hack for a neverending script
        TimeoutStopSec = "1s";
      };
    };
  };
}
