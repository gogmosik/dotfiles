#!/bin/bash

# Громкость спикера (берём среднее)
VOL_LEFT=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]\+%' | head -1 | tr -d '%')
VOL_RIGHT=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]\+%' | tail -1 | tr -d '%')
VOL=$(( (VOL_LEFT + VOL_RIGHT) / 2 ))

MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -q 'yes' && echo "muted" || echo "")

# Громкость микрофона (одно значение)
MIC=$(pactl get-source-volume @DEFAULT_SOURCE@ | grep -o '[0-9]\+%' | head -1 | tr -d '%')
MIC_MUTE=$(pactl get-source-mute @DEFAULT_SOURCE@ | grep -q 'yes' && echo "muted" || echo "")

# Формат
if [ "$MUTE" = "muted" ]; then
    SPEAKER=" 0"
else
    SPEAKER="  $VOL"
fi

if [ "$MIC_MUTE" = "muted" ]; then
    MICRO=" 0"
else
    MICRO=" $MIC"
fi

# Без лишнего |
if [ "$MIC_MUTE" = "muted" ]; then
    echo "{\"text\": \"$SPEAKER\"}"
else
    echo "{\"text\": \"$SPEAKER | $MICRO\"}"
fi
