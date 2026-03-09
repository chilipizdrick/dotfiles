{writeShellScriptBin, ...}:
writeShellScriptBin "toggle-zapret" ''
  SERVICE="zapret.service"
  if systemctl is-active --quiet $SERVICE; then
      systemctl stop $SERVICE
  else
      systemctl start $SERVICE
  fi
''
