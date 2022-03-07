#! /bin/sh

dex -a -s /etc/xdg/autostart/:~/.config/autostart/ &

sxhkd -c $HOME/.config/i3/sxhkdrc &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

dunst &

setxkbmap -option caps:escape

picom --experimental-backends &

set-wallpaper &

clipster -d &

flameshot &

libinput-gestures &

# redshift &

