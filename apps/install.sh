#!/bin/bash

# Install apps
cat $DOTFILES/apps/apps.txt | while read app
do
   echo "INSTALLING: ${app}"
   sudo pacman -S --noconfirm --needed ${app} &>> /dev/null || echo "$app" &>> "$HOME/aur_queue"
    if [ "$app" = "docker" ]; then
        groupadd docker
        sudo gpasswd -a $(whoami) docker
        sudo systemctl enable docker.service
    fi

    if [ "$app" = "mariadb" ]; then
        sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
    fi
done

echo "Installing yay apps"

# Install apps
# cat "$HOME/aur_queue" | while read app
# do
#    echo "INSTALLING: ${app}"
#    yay -S --noconfirm --needed ${app} &>> /dev/null || echo "$app" &>> "$HOME/failed_apps"
#    if [ "$app" = "ly" ]; then
#         sudo systemctl enable ly.service
#    fi
# done

# Tap to click
[ ! -f /etc/X11/xorg.conf.d/30-touchpad.conf ] && sudo printf 'Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "TappingButtonMap" "lrm"
EndSection' > /etc/X11/xorg.conf.d/30-touchpad.conf


sudo mkdir -p /etc/pacman.d/hooks
# auto update installed appos
[ ! -f /etc/pacman.d/hooks/50-pacman-list.hook ] && sudo printf '[Trigger]
Type = Package
Operation = Install
Operation = Upgrade
Operation = Remove
Target = *

[Action]
Description = Create a backup list of all installed packages
When = PostTransaction
Exec = /bin/sh -c 'pacman -Qqe  > "/home/$(whoami)/.dotfiles/apps/apps.txt" 2> /dev/null; exit'
' > /etc/pacman.d/hooks/50-pacman-list.hook
