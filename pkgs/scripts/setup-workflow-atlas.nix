{
  writeShellScriptBin,
  hyprland,
  ...
}:
writeShellScriptBin "setup-workflow-atlas" ''
  ${hyprland}/bin/hyprctl dispatch exec "[workspace 1 silent] ghostty"
  ${hyprland}/bin/hyprctl dispatch exec "[workspace 2 silent] zen"
  ${hyprland}/bin/hyprctl dispatch exec "[workspace 3 silent] vesktop"
  ${hyprland}/bin/hyprctl dispatch exec "[workspace 3 silent] telegram-desktop"
  ${hyprland}/bin/hyprctl dispatch exec "[workspace 4 silent] spotify"
''
