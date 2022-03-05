#! /bin/sh

setxkbmap -option caps:escape

dunst &

sxhkd &

blueman-applet &

picom --experimental-backends &

set-wallpaper &

parcellite &

nm-applet --indicator &

clipster -d &

flameshot &

libinput-gestures &

# pasystray &

dex --autostart --environment i3 &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

sh "$HOME/.config/polybar/launch.sh" &

# redshift &
if [ $(xrandr --query | grep " connected" | wc -l) -gt 2 ]
then
 caffeine -a &
fi

