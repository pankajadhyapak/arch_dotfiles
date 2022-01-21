#!/bin/bash

autorandr -c

blueman-applet &

picom --experimental-backends &

pasystray &


setxkbmap -option caps:escape


#redshift &
