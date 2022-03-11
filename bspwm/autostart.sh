#! /bin/sh

# Kill if already running
killall -9 caffeine picom sxhkd dunst blueman-applet parcellite nm-applet clipster flameshot libinput-gestures pasystray

# start terminal always
if [ $(xdotool search --class "kittymain" | wc -l) = 0 ]; then
    bspc desktop -f '^1'
    kitty --class=kittymain &
fi

dex -a -s /etc/xdg/autostart/:~/.config/autostart/

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

dunst &

sxhkd -c $HOME/bspwm/sxhkdrc &

setxkbmap -option caps:escape

picom --experimental-backends &

set-wallpaper &

clipster -d &

flameshot &

libinput-gestures &

# redshift &

"$HOME/.config/polybar/launch.sh" &

if [ $(xrandr --query | grep " connected" | wc -l) -gt 2 ]
then
 caffeine -a &
fi


