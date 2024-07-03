#!/usr/bin/env bash

icons="$HOME/.config/swaync/icons"

toggle_animations(){
    animations=$(hyprctl -j getoption animations:enabled | jq ".int")

    if [ "${animations}" == "1" ]; then
        hyprctl keyword animations:enabled 0
        notify-send -e -u low -i "$icons/bolt.png" "Animations disabled"
        return 0
    else
        hyprctl keyword animations:enabled 1
        notify-send -e -u low -i "$icons/bolt.png" "Animations enabled"
        return 0
    fi
}

toggle_blur() {
    blur=$(hyprctl -j getoption decoration:blur:enabled | jq ".int")

    if [ "${blur}" == "1" ]; then
        hyprctl keyword decoration:blur:enabled 0
        notify-send -e -u low -i "$icons/wand.png" "Blur disabled"

        return 0
    else
        hyprctl keyword decoration:blur:enabled 1
        notify-send -e -u low -i "$icons/wand.png" "Blur enabled"
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
            echo "Default"
            exit;;
    esac
done
