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
    wayland.windowManager.hyprland.settings = {
      exec-once = [
        # Enable virtual webcamera (relies on VirtualVideoDevice to be initialized)
        ''
          echo 1 | ${pkgs.wf-recorder}/bin/wf-recorder -c rawvideo \
            -m v4l2 \
            -x yuv420p \
            -F scale=512:288 \
            -r 30 -B 30 -D \
            -f $(
              ${pkgs.v4l-utils}/bin/v4l2-ctl --list-devices \
                | grep -A1 'VirtualVideoDevice' \
                | tail -n 1 \
                | sed 's/^\s*\(.*[^ \t]\)\(\s\+\)*$/\1/'
            )
        ''
        # Start hyperion daemon
        "${pkgs.hyperion-ng}hyperiond --desktop"
      ];
    };
  };
}
