#!/bin/bash
git clone https://github.com/catppuccin/grub.git catppuccin-grub-theme

sudo cp -r catppuccin-grub-theme/catppuccin-grub-theme /usr/share/grub/themes/
cp -an /etc/default/grub /etc/default/grub.bak
grep "GRUB_THEME=" /etc/default/grub 2>&1 >/dev/null && sed -i '/GRUB_THEME=/d' /etc/default/grub
echo "GRUB_THEME=\"/usr/share/grub/themes/catppuccin-grub-theme/theme.txt\"" >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

rm -rf catppuccin-grub-theme
