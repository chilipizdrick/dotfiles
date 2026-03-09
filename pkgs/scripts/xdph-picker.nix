# Original script is taken from here https://www.reddit.com/r/hyprland/comments/1htj6up/script_to_use_alternative_screensharepicker/
{
  wlr-randr,
  jq,
  vicinae,
  writeShellScriptBin,
  ...
}:
writeShellScriptBin "xdph-picker" ''
  monitors=$(${wlr-randr}/bin/wlr-randr --json | ${jq}/bin/jq '.[] | .name')
  windows="''${XDPH_WINDOW_SHARING_LIST}"

  result=""

  while IFS= read -r monitor; do
      monitor=$(echo "$monitor" | tr -d '"')
      if [ -n "$result" ]; then
          result="''${result}\n"
      fi
      result="''${result}''${monitor}\tscreen: ''${monitor}"
  done <<< "$monitors"

  if [ -n "$result" ]; then
      result="''${result}\n"
  fi
  result="''${result}region\tSelection Region"

  while IFS= read -r line; do
      if [ -n "$result" ]; then
          result="''${result}\n"
      fi
      result="''${result}''${line}"
  done < <(echo "$windows" | awk -F'\\[HE>\\]' '{
      for(i=1; i<=NF; i++) {
          if ($i == "") continue;

          split($i, window, "\\[HC>\\]");
          id = window[1];

          split(window[2], parts, "\\[HT>\\]");
          class = parts[1];
          title = parts[2];

          if (id != "")
              print id "\t" "window: " title;
      }
  }')

  selection=$(echo -e "$result" | ${vicinae}/bin/vicinae dmenu)

  if [[ $selection == *"screen"* ]]; then
      monitor=$(echo "$selection" | cut -f1)
      echo "[SELECTION]/screen:''${monitor}"
  elif [[ $selection == *"window"* ]]; then
      window_id=$(echo "$selection" | cut -f1)
      echo "[SELECTION]/window:''${window_id}"
  elif [[ $selection == *"region"* ]]; then
      region=$(slurp -f "%o@%x,%y,%w,%h")
      echo "[SELECTION]/region:''${region}"
  fi
''
