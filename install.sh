#!/bin/bash

# install apps
bash $DOTFILES/apps/install.sh


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
ln -s "$DOTFILES/nvim" "$XDG_CONFIG_HOME"

#vscode
mkdir -p "$XDG_CONFIG_HOME/Code/User"
ln -s "$DOTFILES/vscode.json" "$XDG_CONFIG_HOME/Code/User/settings.json"

#autorandr
rm -rf "$XDG_CONFIG_HOME/autorandr"
ln -s "$DOTFILES/autorandr" "$XDG_CONFIG_HOME"

#caffine
rm -rf "$XDG_CONFIG_HOME/caffeine"
ln -s "$DOTFILES/caffeine" "$XDG_CONFIG_HOME"

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

#alacritty
rm -rf "$XDG_CONFIG_HOME/alacritty"
ln -s "$DOTFILES/alacritty" "$XDG_CONFIG_HOME"


#picom
rm -rf "$XDG_CONFIG_HOME/picom"
ln -s "$DOTFILES/picom" "$XDG_CONFIG_HOME"

#polybar
rm -rf "$XDG_CONFIG_HOME/polybar"
ln -s "$DOTFILES/polybar" "$XDG_CONFIG_HOME"

#redshift
rm -rf "$XDG_CONFIG_HOME/redshift"
ln -s "$DOTFILES/redshift" "$XDG_CONFIG_HOME"

#rofi
rm -rf "$XDG_CONFIG_HOME/rofi"
ln -s "$DOTFILES/rofi" "$XDG_CONFIG_HOME"

#dunst
mkdir -p "$XDG_CONFIG_HOME/dunst"
ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"

# X
ln -s "$DOTFILES/.xinitrc" "$HOME"
ln -s "$DOTFILES/.Xresources" "$HOME"
# install apps
bash $DOTFILES/apps/install.sh


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
ln -s "$DOTFILES/nvim" "$XDG_CONFIG_HOME"

#vscode
mkdir -p "$XDG_CONFIG_HOME/Code/User"
ln -s "$DOTFILES/vscode.json" "$XDG_CONFIG_HOME/Code/User/settings.json"

#autorandr
rm -rf "$XDG_CONFIG_HOME/autorandr"
ln -s "$DOTFILES/autorandr" "$XDG_CONFIG_HOME"

#caffine
rm -rf "$XDG_CONFIG_HOME/caffeine"
ln -s "$DOTFILES/caffeine" "$XDG_CONFIG_HOME"

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

#alacritty
rm -rf "$XDG_CONFIG_HOME/alacritty"
ln -s "$DOTFILES/alacritty" "$XDG_CONFIG_HOME"


#picom
rm -rf "$XDG_CONFIG_HOME/picom"
ln -s "$DOTFILES/picom" "$XDG_CONFIG_HOME"

#polybar
rm -rf "$XDG_CONFIG_HOME/polybar"
ln -s "$DOTFILES/polybar" "$XDG_CONFIG_HOME"

#redshift
rm -rf "$XDG_CONFIG_HOME/redshift"
ln -s "$DOTFILES/redshift" "$XDG_CONFIG_HOME"

#rofi
rm -rf "$XDG_CONFIG_HOME/rofi"
ln -s "$DOTFILES/rofi" "$XDG_CONFIG_HOME"

#dunst
mkdir -p "$XDG_CONFIG_HOME/dunst"
ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"

# X
ln -s "$DOTFILES/.xinitrc" "$HOME"
ln -s "$DOTFILES/.Xresources" "$HOME"

# Zsh
mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/zsh-aliases" "$XDG_CONFIG_HOME/zsh/zsh-aliases"
ln -sf "$DOTFILES/zsh/zsh-functions" "$XDG_CONFIG_HOME/zsh/zsh-functions"
ln -sf "$DOTFILES/zsh/zsh-prompt" "$XDG_CONFIG_HOME/zsh/zsh-prompt"

printf '#!/bin/zsh
source "$ZDORDIR/zshrc"' > "$XDG_CONFIG_HOME/zsh/.zshrc"

mkdir -p "$HOME/.local/bin"
ln -sf "$DOTFILES/scripts" "$HOME/.local/bin"
chmod +x -R "$HOME/.local/bin/scripts"

# wallpapers
cp "$DOTFILES/wall.jpg" "$HOME/Pictures/wall.jpg"
betterlockscreen -u "$HOME/Pictures/wall.jpg" --blur 0.5

# guestures
rm -rf "$XDG_CONFIG_HOME/libinput-gestures.conf"
ln -sf "$DOTFILES/libinput-gestures.conf" "$XDG_CONFIG_HOME/libinput-gestures.conf"


# mimeapps.list
rm -rf "$XDG_CONFIG_HOME/mimeapps.list"
ln -sf "$DOTFILES/mimeapps.list" "$XDG_CONFIG_HOME/mimeapps.list"


# Zsh
mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/zsh-aliases" "$XDG_CONFIG_HOME/zsh/zsh-aliases"
ln -sf "$DOTFILES/zsh/zsh-functions" "$XDG_CONFIG_HOME/zsh/zsh-functions"
ln -sf "$DOTFILES/zsh/zsh-prompt" "$XDG_CONFIG_HOME/zsh/zsh-prompt"

printf '#!/bin/zsh

source "$ZDOTDIR/zshrc"' > "$XDG_CONFIG_HOME/zsh/.zshrctest"

mkdir -p "$HOME/.local/bin"
ln -sf "$DOTFILES/scripts" "$HOME/.local/bin"
chmod +x -R "$HOME/.local/bin/scripts"

# wallpapers
cp "$DOTFILES/wall.jpg" "$HOME/Pictures/wall.jpg"
betterlockscreen -u "$HOME/Pictures/wall.jpg" --blur 0.5

# guestures
rm -rf "$XDG_CONFIG_HOME/libinput-gestures.conf"
ln -sf "$DOTFILES/libinput-gestures.conf" "$XDG_CONFIG_HOME/libinput-gestures.conf"


# mimeapps.list
rm -rf "$XDG_CONFIG_HOME/mimeapps.list"
ln -sf "$DOTFILES/mimeapps.list" "$XDG_CONFIG_HOME/mimeapps.list"


# install st as backup
git clone https://github.com/LukeSmithxyz/st "$HOME/.local/st"
cd "$HOME/.local/st"
sudo make clean install

# all done
echo "all done, reboot you system"
