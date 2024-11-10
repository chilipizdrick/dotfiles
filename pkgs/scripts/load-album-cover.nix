{
  writeShellScriptBin,
  imagemagick,
  curl,
  playerctl,
  ...
}:
writeShellScriptBin "load-album-cover" ''
  if [ $(${playerctl}/bin/playerctl metadata | head -1 | awk '{print $1}') == "firefox" ]; then
      echo ""
      exit 0
  fi

  url=$(${playerctl}/bin/playerctl metadata mpris:artUrl)

  if [[ -z $url ]]; then
      echo ""
      exit 0
  elif [[ $url =~ ^file://.*$ ]]; then
      echo ''${url#*file://}
      exit 0
  else
      mkdir /tmp/hyprlock -p >/dev/null
      path="/tmp/hyprlock/$(basename $url)"
      if ! test -e $path; then
          ${curl}/bin/curl -s $url -o "$path"
          ${imagemagick}/bin/magick $path "$path.png"
      fi
      echo "$path.png"
  fi
''
