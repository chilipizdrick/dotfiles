{
  writeShellScriptBin,
  jq,
  libnotify,
  ...
}:
writeShellScriptBin "toggle-hyprland-layout" ''
  LAYOUT=$(hyprctl -j getoption general:layout | ${jq}/bin/jq '.str' | sed 's/"//g')

  case $LAYOUT in
  "master")
    hyprctl keyword general:layout dwindle
    ${libnotify}/bin/notify-send -e -u low "Dwindle layout enabled"
    ;;
  "dwindle")
    hyprctl keyword general:layout master
    ${libnotify}/bin/notify-send -e -u low "Master layout enabled"
    ;;
  *) ;;

  esac
''
