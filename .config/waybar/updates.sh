#!/bin/bash

PACMAN=$(checkupdates 2>/dev/null | wc -l || echo 0)
AUR=$(yay -Qu --aur 2>/dev/null | wc -l || echo 0)
TOTAL=$((PACMAN + AUR))

if [ $TOTAL -gt 0 ]; then
    TEXT=" $PACMAN|$AUR"
    CLASS="pending"
    TOOLTIP="$PACMAN обновлений pacman\n$AUR обновлений AUR"
else
    TEXT=" 0|0"
    CLASS="updated"
    TOOLTIP="Система обновлена"
fi

JSON="{\"text\": \"$TEXT\", \"class\": \"$CLASS\", \"tooltip\": \"$TOOLTIP\"}"
echo "$JSON"
