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


picom --experimental-backends &

set-wallpaper &

dunst &

clipster -d &

flameshot &

libinput-gestures &


unclutter &

if [ $(xrandr --query | grep " connected" | wc -l) -gt 2 ]
then
 caffeine -a &
fi

aw-qt &

# Run xidlehook
xidlehook \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Don't lock when there's audio playing` \
  --not-when-audio \
  `# Dim the screen after 60 seconds, undim if user becomes active` \
  --timer 60 \
   'notify-send --urgency=low -t 2000 "LOCKING screen in 10 seconds"' \
  `# Undim & lock after 10 more seconds` \
  --timer 10 \
    'slock' \
    ''

