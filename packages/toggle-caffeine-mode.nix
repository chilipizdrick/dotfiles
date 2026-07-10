{
  writeShellScriptBin,
  libnotify,
  ...
}: let
  serviceName = "hypridle.service";
in
  writeShellScriptBin "toggle-caffeine-mode" ''
    SUMMARY="☕ Caffeine mode"
    systemctl --user is-active ${serviceName} \
      && systemctl --user stop ${serviceName} \
      && ${libnotify}/bin/notify-send "$SUMMARY" '✅ Enabled' \
      || $(
        systemctl --user start ${serviceName} \
        && ${libnotify}/bin/notify-send "$SUMMARY" '❌ Disabled'
      )
  ''
