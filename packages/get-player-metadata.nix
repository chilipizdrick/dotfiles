{
  writeShellScriptBin,
  playerctl,
  ...
}:
writeShellScriptBin "get-player-metadata" ''
  if [[ -z $(playerctl metadata) ]]; then
      printf ""
      exit 0
  elif [[ "$(${playerctl}/bin/playerctl metadata | head -1 | awk '{print $1}')" != "firefox" ]]; then
      printf "<b>$([ "$(${playerctl}/bin/playerctl status)" != "Paused" ] && [ "$(${playerctl}/bin/playerctl metadata | head -1 | awk '{print $1}')" = "spotify" ] && echo ' ')$([ "$(${playerctl}/bin/playerctl status)" = "Paused" ] && echo ' ')$(${playerctl}/bin/playerctl metadata title | sed 's/\(.\{30\}\).*/\1.../')</b>\n$(${playerctl}/bin/playerctl metadata artist | sed 's/\(.\{30\}\).*/\1.../')"
      exit 0
  else
      printf ""
  fi
''
