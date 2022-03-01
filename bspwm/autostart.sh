#! /bin/sh

# Kill if already running
killall -9 picom sxhkd dunst xfce4-power-manager blueman-applet parcellite nm-applet clipster flameshot libinput-gestures pasystray

# start terminal always
if [ $(xdotool search --class "kittymain" | wc -l) = 0 ]; then
    bspc desktop -f '^1'
    kitty --class=kittymain &
fi

# Enable power management
xfce4-power-manager &

# polkit agent
if [[ ! `pidof xfce-polkit` ]]; then
    /usr/lib/xfce-polkit/xfce-polkit &
fi


dunst &

sxhkd &

setxkbmap -option caps:escape

blueman-applet &

picom --experimental-backends &

set-wallpaper &

parcellite &

nm-applet &

clipster -d &

flameshot &

libinput-gestures &

pasystray &

# redshift &

if [ $(xrandr --query | grep " connected" | wc -l) -gt 2 ]
then
 caffeine -a &
fi

xss-lock -- dm-tool lock &
