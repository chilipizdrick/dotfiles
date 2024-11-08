{writeShellScriptBin, ...}:
writeShellScriptBin "load-album-cover" ''
  if [ $(playerctl metadata | head -1 | awk '{print $1}') == "firefox" ]; then
      echo ""
      exit 0
  fi

  url=$(playerctl metadata mpris:artUrl)

  if [[ -z $url ]]; then
      echo ""
  elif [[ $url =~ ^file://.*$ ]]; then
      echo ''${a#*file://}
  else
      mkdir /tmp/hyprlock -p
      path="/tmp/hyprlock/$(basename $url)"
      if ! test -e $path; then
          curl -s $url -o "$path"
          magick $path "$path.png"
      fi
      echo "$path.png"
  fi
''
