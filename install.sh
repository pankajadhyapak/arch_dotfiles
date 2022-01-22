#!/bin/bash


# Screenshot
mkdir -p "$HOME/Pictures/screenshots"

# Install apps
cat $DOTFILES/apps/pacman.txt | while read line
do
   echo "INSTALLING: ${line}"
   sudo pacman -S --noconfirm --needed ${line}

    if [ "$line" = "docker" ]; then
        groupadd docker
        gpasswd -a $(whoami) docker
        systemctl enable docker.service
    fi


    if [ "$line" = "mariadb" ]; then
        mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
    fi
done

echo "Installing yay apps"

# Install apps
cat $DOTFILES/apps/yay.txt | while read line
do
   echo "INSTALLING: ${line}"
   yay -S --noconfirm --needed ${line}
done


#install global go deps
go install mvdan.cc/gofumpt@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/segmentio/golines@latest

# install PHP deps
rm -rf "$XDG_CONFIG_HOME/composer"
ln -s "$DOTFILES/composer/composer.json" "$XDG_CONFIG_HOME/composer/composer.json"


composer global install

# nvim
mkdir -p "$XDG_CONFIG_HOME/nvim"

#vscode
rm -rf "$XDG_CONFIG_HOME/Code/User/settings.json"
ln -s "$DOTFILES/vscode.json" "$XDG_CONFIG_HOME/Code/User/settings.json"

#autorandr
rm -rf "$XDG_CONFIG_HOME/autorandr"
ln -s "$DOTFILES/autorandr" "$XDG_CONFIG_HOME"

#caffine
rm -rf "$XDG_CONFIG_HOME/caffine"
ln -s "$DOTFILES/caffine" "$XDG_CONFIG_HOME"

#gitconfig
ln -sf "$DOTFILES/git/gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES/git/gitignore" "$HOME/.gitignore"

# i3
rm -rf "$XDG_CONFIG_HOME/i3"
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME"

rm -rf "$XDG_CONFIG_HOME/gtk-3.0"
ln -s "$DOTFILES/gtk-3.0" "$XDG_CONFIG_HOME"

rm -rf "$XDG_CONFIG_HOME/kitty"
ln -s "$DOTFILES/kitty" "$XDG_CONFIG_HOME"

rm -rf "$XDG_CONFIG_HOME/picom"
ln -s "$DOTFILES/picom" "$XDG_CONFIG_HOME"

rm -rf "$XDG_CONFIG_HOME/polybar"
ln -s "$DOTFILES/polybar" "$XDG_CONFIG_HOME"


rm -rf "$XDG_CONFIG_HOME/redshift"
ln -s "$DOTFILES/redshift" "$XDG_CONFIG_HOME"

rm -rf "$XDG_CONFIG_HOME/rofi"
ln -s "$DOTFILES/rofi" "$XDG_CONFIG_HOME"

mkdir -p "$XDG_CONFIG_HOME/dunst"
ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"


ln -s "$DOTFILES/.xinitrc" "$HOME"

# Zsh
mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"

# ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh/aliases"
rm -rf "$XDG_CONFIG_HOME/zsh/plugins"
ln -sf "$DOTFILES/zsh/plugins" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/aliases.zsh" "$XDG_CONFIG_HOME/zsh/aliases.zsh"

mkdir -p "$HOME/.local/bin"
ln -sf "$DOTFILES/scripts" "$HOME/.local/bin"
chmod +x -R "$HOME/.local/bin/scripts"

# wallpapers
cp "$DOTFILES/wall.jpg" "$HOME/Pictures/wall.jpg"
betterlockscreen -u "$HOME/Pictures/wall.jpg" --blur 0.5


# install st
git clone https://github.com/LukeSmithxyz/st "$HOME/.local/st"
cd "$HOME/.local/st"
sudo make clean install

# all done

echo "all done, reboot you system"
