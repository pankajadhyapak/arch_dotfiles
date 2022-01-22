# Arch install script and dotfiles


## Arch Installation

``` bash
curl -L https://raw.githubusercontent.com/pankajadhyapak/arch_dotfiles/master/arch_install.sh > arch_install.sh

bash arch_install.sh
```

### Disable HDMI sound output

```bash
echo "blacklist snd_hda_codec_hdmi" >  /etc/modprobe.d/blacklist.conf
```

### Update installed packages
```bash
pacman -Qqen > "$DOTFILES/apps/pacman.txt"
```

```bash
 pacman -Qqm > "$DOTFILES/apps/yay.txt"
```
