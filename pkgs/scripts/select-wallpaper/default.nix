{
  writeShellScriptBin,
  rofi-wayland,
  swww,
  ...
}:
writeShellScriptBin "select-wallpaper" ''
  wallpaperDir="$HOME/Pictures/wallpapers"

  FPS=120
  TYPE="simple"
  DURATION=3
  BEZIER="0.4,0.2,0.4,1.0"
  SWWW_PARAMS="--transition-fps ''${FPS} --transition-type ''${TYPE} --transition-duration ''${DURATION} --transition-bezier ''${BEZIER}"
  PICS=($(find $(realpath "''${wallpaperDir}") -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png \) | sort ))

  randomNumber=$(( ($(date +%s) + RANDOM) + $$ ))
  randomPicture="''${PICS[$(( randomNumber % ''${#PICS[@]} ))]}"
  randomChoice="[''${#PICS[@]}] Random"
  rofiCommand="${rofi-wayland}/bin/rofi -show -dmenu -theme ${./theme.rasi}"

  executeCommand() {
    ${swww}/bin/swww img "$1" ''${SWWW_PARAMS}
    ln -sf "$1" "$HOME/.current_wallpaper"
  }

  menu() {
    printf "$randomChoice\x00icon\x1f${./random.png}\n"
    for i in "''${!PICS[@]}"; do
      if [[ -z $(echo "''${PICS[$i]}" | grep .gif$) ]]; then
        printf "$(basename "''${PICS[$i]}" | cut -d. -f1)\x00icon\x1f''${PICS[$i]}\n"
      else
        printf "$(basename "''${PICS[$i]}")\n"
      fi
    done
  }

  swww query || ${swww}/bin/swww-daemon &

  main() {
    choice=$(menu | ''${rofiCommand})
    if [[ -z $choice ]]; then
      exit 0
    fi
    if [ "$choice" = "$randomChoice" ]; then
      executeCommand "''${randomPicture}"
      return 0
    fi
    for file in "''${PICS[@]}"; do
      if [[ "$(basename "$file" | cut -d. -f1)" = "$choice" ]]; then
        selectedFile="$file"
        break
      fi
    done
    if [[ -n "$selectedFile" ]]; then
      executeCommand "''${selectedFile}"
      return 0
    else
      echo "Image not found."
      exit 1
    fi
  }

  if pidof ${rofi-wayland}/bin/rofi > /dev/null; then
    pkill rofi
    exit 0
  fi

  main
''
