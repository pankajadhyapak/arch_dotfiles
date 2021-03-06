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
cat "$HOME/aur_queue" | while read app
do
   echo "INSTALLING: ${app}"
   yay -S --noconfirm --needed ${app} &>> /dev/null || echo "$app" &>> "$HOME/failed_apps"
   if [ "$app" = "ly" ]; then
        sudo systemctl enable ly.service
   fi
done

sudo gpasswd -a $(whoami) input
