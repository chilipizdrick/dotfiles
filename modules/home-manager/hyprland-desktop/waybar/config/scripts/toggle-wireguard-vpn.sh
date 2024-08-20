#!/usr/bin/env sh

if [ -z "$(systemctl list-units | grep "wg-quick-wg0")" ]
then
    systemctl start wg-quick-wg0
else
    systemctl stop wg-quick-wg0
fi
