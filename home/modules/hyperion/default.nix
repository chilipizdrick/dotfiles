{
  config,
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
        "echo 1 | wf-recorder -c rawvideo -m v4l2 -x yuv420p -F scale=512:288 -r 30 -B 30 -D -f $(v4l2-ctl --list-devices | grep -A1 'VirtualVideoDevice' | tail -n 1 | sed 's/^\s*\(.*[^ \t]\)\(\s\+\)*$/\1/')"
        # Start hyperion daemon
        "hyperiond --desktop -u $HOME/.hyperion"
      ];
    };
  };
}
