{writeShellScriptBin, ...}:
writeShellScriptBin "reload-graphical-interface" ''
  services=(waybar.service awww.service gammastep.service vicinae.service)

  for service in "''${services[@]}"; do
    if systemctl --user is-active "''${service}" > /dev/null; then
      systemctl --user stop "''${service}"
    fi
  done

  for service in "''${services[@]}"; do
    systemctl --user start "''${service}"
  done

  hyprctl reload
''
