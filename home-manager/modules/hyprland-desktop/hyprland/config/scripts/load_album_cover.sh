#!/usr/bin/env fish

if  [ (playerctl metadata | head -1 | awk '{print $1}') = "firefox" ]
    # echo "$HOME/.config/hypr/scripts/unico.png"
    echo ""
    exit 0
end

set url (playerctl metadata mpris:artUrl)

if test -z $url
    # echo "$HOME/.config/hypr/scripts/unico.png"
    echo ""
else if string match -q --regex "^file://" $url
    echo (string replace --regex "^file://" '' $url)
else
    mkdir /tmp/hyprlock -p
    set path /tmp/hyprlock/(basename $url)
    if not test -e $path
        curl -s $url -o "$path"
        magick $path "$path".png
    end
    echo "$path".png
end
