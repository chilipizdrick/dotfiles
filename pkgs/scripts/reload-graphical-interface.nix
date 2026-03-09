{writeShellScriptBin, ...}:
writeShellScriptBin "reload-graphical-interface" ''
  services=(waybar.service swww.service gammastep.service)

  for service in "''${services[@]}"; do
    if systemctl --user is-active "''${service}" > /dev/null; then
      systemctl --user stop "''${service}"
    fi
  done

  for service in "''${services[@]}"; do
    systemctl --user start "''${service}"
  done

  exit 0
''
