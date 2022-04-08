#!/bin/bash

# install apps
bash $DOTFILES/apps/install.sh
sudo sh $DOTFILES/grub_theme.sh

# Screenshot
mkdir -p "$HOME/Pictures/screenshots"

#install global go deps
go install mvdan.cc/gofumpt@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/segmentio/golines@latest

# install PHP deps
mkdir -p "$XDG_CONFIG_HOME/composer"
ln -s "$DOTFILES/composer/composer.json" "$XDG_CONFIG_HOME/composer/composer.json"
composer global install

# nvim
rm -rf "$XDG_CONFIG_HOME/nvim"
git clone https://github.com/pankajadhyapak/nvim.git "$XDG_CONFIG_HOME/nvim"

#vscode
mkdir -p "$XDG_CONFIG_HOME/Code/User"
ln -s "$DOTFILES/vscode.json" "$XDG_CONFIG_HOME/Code/User/settings.json"

#autorandr
rm -rf "$XDG_CONFIG_HOME/autorandr"
ln -s "$DOTFILES/autorandr" "$XDG_CONFIG_HOME"

#bat
rm -rf "$XDG_CONFIG_HOME/bat"
ln -s "$DOTFILES/bat" "$XDG_CONFIG_HOME"

#flameshot
rm -rf "$XDG_CONFIG_HOME/flameshot"
ln -s "$DOTFILES/flameshot" "$XDG_CONFIG_HOME"

#gitconfig
rm -rf "$HOME/.gitignore"
ln -sf "$DOTFILES/git/gitignore" "$HOME/.gitignore"
git config --global core.excludesFile  "$HOME/.gitignore"

# i3
rm -rf "$XDG_CONFIG_HOME/i3"
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME"


#gtk theme
rm -rf "$XDG_CONFIG_HOME/gtk-3.0"
ln -s "$DOTFILES/gtk-3.0" "$XDG_CONFIG_HOME"

#kitty
rm -rf "$XDG_CONFIG_HOME/kitty"
ln -s "$DOTFILES/kitty" "$XDG_CONFIG_HOME"

#tmux
rm -rf "$HOME/.tmux.conf"
ln -s "$DOTFILES/tmux/tmux.conf" "$HOME/.tmux.conf"

#picom
rm -rf "$XDG_CONFIG_HOME/picom"
ln -s "$DOTFILES/picom" "$XDG_CONFIG_HOME"

#redshift
rm -rf "$XDG_CONFIG_HOME/redshift"
ln -s "$DOTFILES/redshift" "$XDG_CONFIG_HOME"

#rofi
rm -rf "$XDG_CONFIG_HOME/rofi"
ln -s "$DOTFILES/rofi" "$XDG_CONFIG_HOME"

#dunst
rm -rf "$XDG_CONFIG_HOME/dunst"
ln -sf "$DOTFILES/dunst" "$XDG_CONFIG_HOME"


# Zsh
mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/zsh-aliases" "$XDG_CONFIG_HOME/zsh/zsh-aliases"
ln -sf "$DOTFILES/zsh/zsh-functions" "$XDG_CONFIG_HOME/zsh/zsh-functions"
ln -sf "$DOTFILES/zsh/zsh-prompt" "$XDG_CONFIG_HOME/zsh/zsh-prompt"
printf '#!/bin/zsh

source "$ZDOTDIR/zshrc"' > "$XDG_CONFIG_HOME/zsh/.zshrc"

# X
ln -s "$DOTFILES/X11/.xinitrc" "$HOME"
ln -s "$DOTFILES/X11/.Xresources" "$HOME"
ln -s "$DOTFILES/X11/.xprofile" "$HOME"

mkdir -p "$HOME/.local/bin"
ln -sf "$DOTFILES/scripts" "$HOME/.local/bin"
chmod +x -R "$HOME/.local/bin/scripts"

#dwm
rm -rf "$XDG_CONFIG_HOME/dwm"
ln -sf "$DOTFILES/dwm" "$XDG_CONFIG_HOME/dwm"

#zathura
rm -rf "$XDG_CONFIG_HOME/zathura"
ln -s "$DOTFILES/zathura" "$XDG_CONFIG_HOME"

# wallpapers
cp "$DOTFILES/wallpaper.png" "$HOME/Pictures/wallpaper.png"

# guestures
rm -rf "$XDG_CONFIG_HOME/libinput-gestures.conf"
ln -sf "$DOTFILES/libinput-gestures.conf" "$XDG_CONFIG_HOME/libinput-gestures.conf"

# mimeapps.list
rm -rf "$XDG_CONFIG_HOME/mimeapps.list"
ln -sf "$DOTFILES/mimeapps.list" "$XDG_CONFIG_HOME/mimeapps.list"


# install st as backup
git clone https://github.com/pankajadhyapak/st "$HOME/.local/st"
cd "$HOME/.local/st"
sudo make clean install

# install Dwm
git clone https://github.com/pankajadhyapak/dwm "$HOME/.local/dwm"
cd "$HOME/.local/dwm"
sudo make clean install

# install Dwm blocks
git clone https://github.com/pankajadhyapak/dwmblocks "$HOME/.local/dwmblocks"
cd "$HOME/.local/dwmblocks"
sudo make clean install

# install slock
git clone https://github.com/pankajadhyapak/slock "$HOME/.local/slock"
cd "$HOME/.local/slock"
sudo make clean install

# all done
echo "all done, reboot you system"
