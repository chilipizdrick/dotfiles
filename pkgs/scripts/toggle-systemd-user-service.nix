{writeShellScriptBin, ...}:
writeShellScriptBin "toggle-systemd-user-service" ''
  service=$1

  if systemctl --user is-active "$service" > /dev/null; then
    systemctl --user stop "$service"
  else
    systemctl --user start "$service"
  fi
''
