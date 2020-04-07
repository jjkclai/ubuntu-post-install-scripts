#!/bin/sh

STATUS=$( ibus engine )

if [ "$STATUS" = "xkb:us::eng" ]; then
    echo "EN_US"
else
    echo "ZH_TW"
fi
