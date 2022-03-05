#! /bin/sh

# Kill if already running
killall -9 picom sxhkd dunst blueman-applet parcellite nm-applet clipster flameshot libinput-gestures pasystray

# start terminal always
if [ $(xdotool search --class "kittymain" | wc -l) = 0 ]; then
    bspc desktop -f '^1'
    kitty --class=kittymain &
fi

dex --autostart --environment bspwm &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

dunst &

sxhkd &

setxkbmap -option caps:escape

blueman-applet &

picom --experimental-backends &

set-wallpaper &

parcellite &

nm-applet --indicator &

clipster -d &

flameshot &

libinput-gestures &

pasystray &

# redshift &

if [ $(xrandr --query | grep " connected" | wc -l) -gt 2 ]
then
 caffeine -a &
fi


