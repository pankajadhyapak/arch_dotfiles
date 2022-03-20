#!/bin/bash

setxkbmap -option caps:escape

# polkit agent
if [[ ! `pidof xfce-polkit` ]]; then
    /usr/lib/xfce-polkit/xfce-polkit &
fi

# autostart apps
dex -a -s ~/.config/autostart/ &

# Kill if already running
killall -9 sxhkd dunst picom dwmblocks flameshot

blueman-applet &

parcellite &

nm-applet &

sxhkd -c $XDG_CONFIG_HOME/dwm/sxhkdrc &

picom --experimental-backends &

set-wallpaper &

dunst &

clipster -d &

flameshot &

libinput-gestures &

dwmblocks &

if [ $(xrandr --query | grep " connected" | wc -l) -gt 2 ]
then
 caffeine -a &
fi
