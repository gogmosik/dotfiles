#!/bin/bash

# Логируем запуск (по желанию)
echo "[$(date)] mic-boost-loop.sh запущен" >> /tmp/mic-boost.log

while true; do
    # Текущая громкость микрофона (берём первое значение)
    CURRENT=$(pactl get-source-volume @DEFAULT_SOURCE@ 2>/dev/null | grep -o '[0-9]\+%' | head -1 | tr -d '%')

    # Если не число — пропускаем
    if ! [[ "$CURRENT" =~ ^[0-9]+$ ]]; then
        sleep 5
        continue
    fi

    # Если <80% — поднимаем до 100%
    if [ "$CURRENT" -lt 80 ]; then
        pactl set-source-volume @DEFAULT_SOURCE@ 100%
        echo "[$(date)] Микрофон был $CURRENT% → поднят до 100%" >> /tmp/mic-boost.log
    fi

    # Ждём 30 сек
    sleep 5
done
