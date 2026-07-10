{
  writeShellScriptBin,
  playerctl,
  ...
}:
writeShellScriptBin "get-player-metadata" ''
  metadata="$(${playerctl}/bin/playerctl metadata -f '{{playerName}}|{{status}}|{{title}}|{{artist}}' 2>/dev/null)"
  if [[ -z "$metadata" ]]; then
    exit 0
  fi

  IFS='|' read -r player status title artist <<< "$metadata"

  [[ ''${#title} -gt 30 ]] && title="''${title:0:30}..."
  [[ ''${#artist} -gt 30 ]] && artist="''${artist:0:30}..."

  icon=" "
  if [[ "$status" == "Paused" ]]; then
    icon=" "
  elif [[ "$player" == *"spotify"* ]]; then
    icon=" "
  fi

  printf "<b>%s%s</b>\n%s" "$icon" "$title" "$artist"
''
