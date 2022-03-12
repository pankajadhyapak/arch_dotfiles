#!/bin/bash


# Make pacman colorful, concurrent downloads and Pacman eye-candy.
grep -q "ILoveCandy" /etc/pacman.conf || sed -i "/#VerbosePkgLists/a ILoveCandy" /etc/pacman.conf
sed -i "s/^#ParallelDownloads = 8$/ParallelDownloads = 5/;s/^#Color$/Color/" /etc/pacman.conf

# Use all cores for compilation.
sed -i "s/-j2/-j$(nproc)/;s/^#MAKEFLAGS/MAKEFLAGS/" /etc/makepkg.conf

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

    if [ "$app" = "lightdm" ]; then
        sudo systemctl enable lightdm.service
    fi
done

echo "Installing yay apps"

# Install apps
cat "$HOME/aur_queue" | while read app
do
   echo "INSTALLING: ${app}"
   yay -S --noconfirm --needed ${app} &>> /dev/null || echo "$app" &>> "$HOME/failed_apps"
done

# Tap to click
[ ! -f /etc/X11/xorg.conf.d/30-touchpad.conf ] && printf 'Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "TappingButtonMap" "lrm"
EndSection' > /etc/X11/xorg.conf.d/30-touchpad.conf


