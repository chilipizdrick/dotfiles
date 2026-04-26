{
  writeShellScriptBin,
  hyprland,
  ...
}:
writeShellScriptBin "setup-workflow-aurora" ''
  ${hyprland}/bin/hyprctl dispatch exec "[workspace 1 silent] ghostty"
  ${hyprland}/bin/hyprctl dispatch exec "[workspace 2 silent] zen"
  ${hyprland}/bin/hyprctl dispatch exec "[workspace 10 silent] vesktop"
  ${hyprland}/bin/hyprctl dispatch exec "[workspace 10 silent] telegram-desktop"
  ${hyprland}/bin/hyprctl dispatch exec "[workspace 10 silent] spotify"
''
