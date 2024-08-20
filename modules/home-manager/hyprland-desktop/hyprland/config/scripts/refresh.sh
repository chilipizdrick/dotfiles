#!/usr/bin/env sh

# Kill already running processes
_ps=(waybar rofi swaync)
for _prs in "${_ps[@]}"; do
    if pidof "${_prs}" >/dev/null; then
        pkill "${_prs}"
    fi
done

# Relaunch waybar
waybar > /dev/null 2>&1 &
# relaunch swaync
swaync > /dev/null 2>&1 &

exit 0
