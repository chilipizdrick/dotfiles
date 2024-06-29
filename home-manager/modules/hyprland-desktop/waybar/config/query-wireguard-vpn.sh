#!/usr/bin/env bash

if [ -z "$(systemctl list-units | grep "wg-quick-wg0")" ]
then
    # systemctl start wg-quick-wg0
    echo "VPN (off)"
    echo "VPN (off)"
    echo "off"
else
    # systemctl stop wg-quick-wg0
    echo "VPN (on)"
    echo "VPN (on)"
    echo "on"
fi
