{
  hyprland,
  writeShellScriptBin,
  ...
}:
writeShellScriptBin "toggle-window-decorations" ''
  if [ $(${hyprland}/bin/hyprctl getoption general:border_size | awk 'NR==1 {print $2}') != "0" ]; then
      ${hyprland}/bin/hyprctl keyword general:border_size 0
      ${hyprland}/bin/hyprctl keyword general:gaps_in 0
      ${hyprland}/bin/hyprctl keyword general:gaps_out 0
      ${hyprland}/bin/hyprctl keyword decoration:rounding 0
  else
      ${hyprland}/bin/hyprctl reload
  fi

''
