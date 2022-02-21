#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch new polybar(s)
if type "xrandr"; then
    IFS=$'\n'  # must set internal field separator to avoid dumb
    for entry in $(xrandr --query | grep " connected"); do
        mon=$(cut -d" " -f1 <<< "$entry")
        status=$(cut -d" " -f3 <<< "$entry")

        tray_pos=""
        if [ "$status" == "primary" ]; then
            tray_pos="right"
        fi
        if [ "$status" != "(normal" ]; then
            MONITOR=$mon TRAY_POS=$tray_pos polybar -r main & disown
        fi
    done
    unset IFS  # avoid mega dumb by resetting the IFS
else
    polybar -r main 2>&1 | tee -a /tmp/polybar.log & disown
fi

echo "Bars launched..."



