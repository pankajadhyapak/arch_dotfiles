#!/bin/bash

autorandr -c

blueman-applet &

picom --experimental-backends &

setxkbmap -option caps:escape

set-wallpaper &

parcellite &

dunst &

nm-applet &

clipster -d &

flameshot &

libinput-gestures &
# redshift &
