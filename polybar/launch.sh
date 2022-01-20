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

        MONITOR=$mon TRAY_POS=$tray_pos polybar -r main & disown
    done
    unset IFS  # avoid mega dumb by resetting the IFS
else
    polybar -r main 2>&1 | tee -a /tmp/polybar.log & disown
fi


# if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar --reload main &
#   done
# else
#   polybar --reload example &
# fi

echo "Bars launched..."



