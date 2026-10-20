#!/bin/bash


while true; do
    CURRENT=$(pactl get-source-volume @DEFAULT_SOURCE@ 2>/dev/null | grep -o '[0-9]\+%' | head -1 | tr -d '%')

    if ! [[ "$CURRENT" =~ ^[0-9]+$ ]]; then
        sleep 5
        continue
    fi

    if [ "$CURRENT" -lt 80 ]; then
        pactl set-source-volume @DEFAULT_SOURCE@ 100%
        echo "[$(date)] Микрофон был $CURRENT% → поднят до 100%" >> /tmp/mic-boost.log
    fi

    sleep 5
done
