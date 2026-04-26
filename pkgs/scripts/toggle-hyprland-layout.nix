{
  writeShellScriptBin,
  jq,
  libnotify,
  hyprland,
  ...
}:
writeShellScriptBin "toggle-hyprland-layout" ''
  LAYOUT=$(${hyprland}/bin/hyprctl -j getoption general:layout | ${jq}/bin/jq '.str' | sed 's/"//g')

  case $LAYOUT in
  "master")
    ${hyprland}/bin/hyprctl keyword general:layout dwindle
    ${libnotify}/bin/notify-send -e -u low "Dwindle layout enabled"
    ;;
  "dwindle")
    ${hyprland}/bin/hyprctl keyword general:layout master
    ${libnotify}/bin/notify-send -e -u low "Master layout enabled"
    ;;
  *) ;;

  esac
''
