#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

if type "xrandr"; then
    for entry in $(xrandr --listactivemonitors | sed -n '2,$s/^.*\s\(\S\+\)$/\1/p'); do
        if [ "$entry" == $(xrandr | sed -n 's/^\(\S\+\).*primary.*$/\1/p') ]; then
            MONITOR=$entry  polybar -r main 2>&1 | tee -a /tmp/polybar.log & disown
        else
            MONITOR=$entry  polybar -r external 2>&1 | tee -a /tmp/polybar_external.log & disown
        fi
    done
else
    polybar -r main 2>&1 | tee -a /tmp/polybar.log & disown
fi
echo "Bars launched..."
