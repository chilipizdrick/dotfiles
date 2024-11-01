#!/usr/bin/env sh

if [[ -z $(playerctl metadata) ]]; then
    # printf "<b>No music</b>\nJust Unico..."
    printf ""
    exit 0
elif [[ "$(playerctl metadata | head -1 | awk '{print $1}')" != "firefox" ]]; then
    printf "<b>$([ "$(playerctl status)" != "Paused" ] && [ "$(playerctl metadata | head -1 | awk '{print $1}')" = "spotify" ] && echo ' ')$([ "$(playerctl status)" = "Paused" ] && echo '|| ')$(playerctl metadata title | sed 's/\(.\{30\}\).*/\1.../')</b>\n$(playerctl metadata artist | sed 's/\(.\{30\}\).*/\1.../')"

    exit 0
else
    printf ""
    exit 0
fi

