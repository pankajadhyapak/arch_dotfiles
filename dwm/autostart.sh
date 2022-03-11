#!/bin/bash

dex -a -s /etc/xdg/autostart/:~/.config/autostart/ &

sxhkd -c $XDG_CONFIG_HOME/dwm/sxhkdrc &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

setxkbmap -option caps:escape

picom --experimental-backends &

set-wallpaper &

dunst &

clipster -d &

flameshot &

libinput-gestures &

dwmblocks &
