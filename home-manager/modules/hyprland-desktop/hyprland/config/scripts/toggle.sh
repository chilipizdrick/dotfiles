#!/usr/bin/env sh

toggle_animations(){
    animations=$(hyprctl -j getoption animations:enabled | jq ".int")

    if [ "${animations}" == "1" ]; then
        hyprctl keyword animations:enabled 0
        notify-send -e -u low "Animations disabled"
        return 0
    else
        hyprctl keyword animations:enabled 1
        notify-send -e -u low "Animations enabled"
        return 0
    fi
}

toggle_blur() {
    blur=$(hyprctl -j getoption decoration:blur:enabled | jq ".int")

    if [ "${blur}" == "1" ]; then
        hyprctl keyword decoration:blur:enabled 0
        notify-send -e -u low "Blur disabled"

        return 0
    else
        hyprctl keyword decoration:blur:enabled 1
        notify-send -e -u low "Blur enabled"
        return 0
    fi
}

for opt in $@; do
    case "$opt" in
        animations)
            toggle_animations;;
        blur)
            toggle_blur;;
        *)
            hyprctl reload
            echo "Default configuration enabled"
            exit;;
    esac
done