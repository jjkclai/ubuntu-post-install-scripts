#!/bin/sh

STATUS=$( nordvpn status | grep Status | tr -d ' ' | cut -d ':' -f2 )

if [ "$STATUS" = "Connected" ]; then
    echo "%{A1:nordvpn set killswitch off; nordvpn d:}$(nordvpn status | grep City | cut -d ':' -f2) ($(curl -sf ifconfig.co))%{A}"
else
    echo "%{A1:nordvpn set killswitch on; nordvpn c:}Disconnected ($(curl -sf ifconfig.co))%{A}"
fi
