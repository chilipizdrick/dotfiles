{
  writeShellScriptBin,
  libnotify,
  ...
}: let
  serviceName = "hypridle.service";
in
  writeShellScriptBin "toggle-caffeine-mode" ''
    systemctl --user is-active ${serviceName} \
      && systemctl --user stop ${serviceName} \
      && ${libnotify}/bin/notify-send '☕ Caffeine mode enabled' \
      || $(
        systemctl --user start ${serviceName} \
        && ${libnotify}/bin/notify-send '☕ Caffeine mode disabled'
      )
  ''
