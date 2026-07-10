{
  writeShellScriptBin,
  curl,
  playerctl,
  imagemagick,
  ...
}:
writeShellScriptBin "load-album-cover" ''
  metadata="$(${playerctl}/bin/playerctl metadata -f '{{playerName}}|{{mpris:artUrl}}' 2>/dev/null)"
  IFS='|' read -r player url <<< "$metadata"

  if [[ "$player" == *"firefox"* ]] || [[ -z "$url" ]]; then
    exit 0
  fi

  if [[ "$url" == file://* ]]; then
    source_path="''${url#file://}"
  else
    mkdir -p /tmp/hyprlock
    source_path="/tmp/hyprlock/$(basename "$url")"
    if [[ ! -f "$source_path" ]]; then
      ${curl}/bin/curl -sL "$url" -o "$source_path"
    fi
  fi

  is_square=$(${imagemagick}/bin/magick identify -format "%[fx:w==h]" "$source_path" 2>/dev/null)

  if [[ "$is_square" == "1" ]]; then
    echo "$source_path"
  else
    exit 0
  fi
''
