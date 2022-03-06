#! /bin/sh

dex -a -s /etc/xdg/autostart/:~/.config/autostart/

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

dunst &

setxkbmap -option caps:escape

picom --experimental-backends &

set-wallpaper &

clipster -d &

flameshot &

libinput-gestures &

# redshift &

if [ $(xrandr --query | grep " connected" | wc -l) -gt 2 ]
then
 caffeine -a &
fi


