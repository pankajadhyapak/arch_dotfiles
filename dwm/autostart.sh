#!/bin/bash

setxkbmap -option caps:escape

# polkit agent
/usr/bin/gnome-keyring-daemon --start --components=secrets &

# autostart apps
dex -a -s ~/.config/autostart/ &

# Kill if already running
killall -9 sxhkd dunst picom dwmblocks flameshot unclutter

blueman-applet &

nm-applet &

sxhkd -c $XDG_CONFIG_HOME/dwm/sxhkdrc &

picom --experimental-backends &

set-wallpaper &

dunst &

clipster -d &

flameshot &

libinput-gestures &

dwmblocks &

unclutter &

if [ $(xrandr --query | grep " connected" | wc -l) -gt 2 ]
then
 caffeine -a &
fi


# Run xidlehook
xidlehook \
  --not-when-fullscreen \
  --not-when-audio \
  --timer 60`` \
   'notify-send --urgency=critical "LOCKING screen in 10 seconds"' \
   '' \
  --timer 10 \
    'slock' \
    ''
