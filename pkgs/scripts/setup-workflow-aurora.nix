{writeShellScriptBin, ...}:
writeShellScriptBin "setup-workflow-aurora" ''
  hyprctl dispatch exec "[workspace 1 silent] ghostty"
  hyprctl dispatch exec "[workspace 2 silent] zen"
  hyprctl dispatch exec "[workspace 10 silent] vesktop"
  hyprctl dispatch exec "[workspace 10 silent] telegram-desktop"
  hyprctl dispatch exec "[workspace 10 silent] spotify"
''
