{writeShellScriptBin, ...}:
writeShellScriptBin "query-zapret" ''
  if systemctl is-active --quiet zapret.service; then
      echo "Zapret (on)"
      echo "Zapret (on)"
      echo "on"
  else
      echo "Zapret (off)"
      echo "Zapret (off)"
      echo "off"
  fi
''
