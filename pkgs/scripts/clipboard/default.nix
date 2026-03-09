{
  writeShellScriptBin,
  rofi,
  cliphist,
  wl-clipboard,
  ...
}:
writeShellScriptBin "clipboard" ''
  while true; do
      result=$(
          ${rofi}/bin/rofi -dmenu \
              -kb-custom-1 "Control-Delete" \
              -kb-custom-2 "Alt-Delete" \
              -theme ${./theme.rasi} < <(${cliphist}/bin/cliphist list)
      )

      case "$?" in
          1)
              exit
              ;;
          0)
              case "$result" in
                  "")
                      continue
                      ;;
                  *)
                      ${cliphist}/bin/cliphist decode <<<"$result" | ${wl-clipboard}/bin/wl-copy
                      exit
                      ;;
              esac
              ;;
          10)
              ${cliphist}/bin/cliphist delete <<<"$result"
              ;;
          11)
              ${cliphist}/bin/cliphist wipe
              ;;
      esac
  done
''
