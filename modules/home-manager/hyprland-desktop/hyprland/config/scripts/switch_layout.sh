#!/usr/bin/env bash

LAYOUT=$(hyprctl -j getoption general:layout | jq '.str' | sed 's/"//g')

case $LAYOUT in
"master")
	hyprctl keyword general:layout dwindle
  notify-send -e -u low "Dwindle layout enabled"
	;;
"dwindle")
	hyprctl keyword general:layout master
  notify-send -e -u low "Master layout enabled"
	;;
*) ;;

esac
