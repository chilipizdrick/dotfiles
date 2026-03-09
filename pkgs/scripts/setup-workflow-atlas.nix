{writeShellScriptBin, ...}:
writeShellScriptBin "setup-workflow-atlas" ''
  hyprctl dispatch exec "[workspace 1 silent] ghostty"
  hyprctl dispatch exec "[workspace 2 silent] zen"
  hyprctl dispatch exec "[workspace 3 silent] vesktop"
  hyprctl dispatch exec "[workspace 3 silent] telegram-desktop"
  hyprctl dispatch exec "[workspace 4 silent] spotify"
''
