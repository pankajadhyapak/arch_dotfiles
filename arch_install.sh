set -euo pipefail

pacman -Sy
pacman --noconfirm -S dialog

iso=$(curl -4 ifconfig.co/country-iso)

reflector -a 48 -c $iso -f 5 -l 20 --sort rate --save /etc/pacman.d/mirrorlist

sed -i "s/^#ParallelDownloads = 5$/ParallelDownloads = 15/" /etc/pacman.conf
pacman --noconfirm -Sy archlinux-keyring

loadkeys us
timedatectl set-ntp true

#Enable multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
pacman -Sy --noconfirm

dialog --no-cancel --inputbox "Please enter your computer name " 10 60 2> hostname
hostname=$(cat hostname) && rm hostname

dialog --no-cancel --inputbox "Please enter your username" 10 60 2> username
username=$(cat username) && rm username
dialog --no-cancel --passwordbox "Enter your password" 10 60 2> pass1
dialog --no-cancel --passwordbox "Enter your password again. To be sure..." 10 60 2> pass2

while [ "$(cat pass1)" != "$(cat pass2)" ]
do
    dialog --no-cancel --passwordbox "Passwords do not match.\n\nEnter password again." 10 60 2> pass1
    dialog --no-cancel --passwordbox "Retype password." 10 60 2> pass2
done
pass1=$(cat pass1)

devices_list=($(lsblk -d | awk '{print "/dev/" $1 " " $4 " on"}' | grep -E 'sd|hd|vd|nvme|mmcblk'))
dialog --title "Choose your hard drive" --no-cancel --radiolist \
    "Where do you want to install your new system?\n\n\
    Select with SPACE, valid with ENTER.\n\n\
    WARNING: Everything will be DESTROYED on the hard disk!" 15 60 4 "${devices_list[@]}" 2> drive
drive=$(cat drive) && rm drive


dialog --no-cancel \
        --title "Drive nvme(ssd)" \
        --menu "is your drive ($drive) nvme" 15 60 4 \
        1 "No" \
        2 "Yes"  2> nvme

nvme=$(cat nvme) && rm nvme

swapdrive="${drive}2"
maindrive="${drive}3"
bootdrive="${drive}1"

if [ "$nvme" -eq 2 ]; then
  swapdrive="${drive}p2"
  maindrive="${drive}p3"
  bootdrive="${drive}p1"
fi

partprobe "$drive"

#g - create non empty GPT partition table
#n - create new partition
#p - primary partition
#e - extended partition
#w - write the table to disk and exit
fdisk "$drive" <<EOF
g
n


+512M
t
2
n


+8G
n



w
EOF

mkswap "${swapdrive}"
swapon "${swapdrive}"


mkfs.ext4 "${maindrive}"

mkfs.fat -F32 "${bootdrive}"

mount "${maindrive}" /mnt
pacstrap /mnt base base-devel linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
sed '1,/^#part2$/d' arch_install.sh > /mnt/arch_install2.sh
chmod +x /mnt/arch_install2.sh
arch-chroot /mnt ./arch_install2.sh $hostname $bootdrive $username $pass1

dialog --title "Reboot time" --yesno "Congrats! The install is done! \n\n Do you want to restart now?" 20 60
response=$?
case $response in
    0) reboot;;
    1) clear;;
esac
exit


#part2
printf '\033c'
pacman -S --noconfirm sed
sed -i "s/^#ParallelDownloads = 5$/ParallelDownloads = 15/" /etc/pacman.conf


ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=us" > /etc/vconsole.conf

echo "${1}" > /etc/hostname
echo "127.0.0.1       localhost" >> /etc/hosts
echo "::1             localhost" >> /etc/hosts
echo "127.0.1.1       ${1}.localdomain ${1}" >> /etc/hosts
mkinitcpio -P


echo "root:${4}" | chpasswd

pacman --noconfirm -S grub efibootmgr os-prober
mkdir /boot/efi
mount "${2}" /boot/efi
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# install microcode
pacman -S --noconfirm intel-ucode
proc_ucode=intel-ucode.img

# Graphics Drivers find and install
pacman -S libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils lib32-mesa --needed --noconfirm

# install essential packages
pacman -S --noconfirm xorg-server xorg-xinit xorg-xprop xdg-utils xdg-user-dirs git man-db neovim zip unzip unrar p7zip dialog zsh networkmanager wget bluez bluez-utils

systemctl enable NetworkManager.service
systemctl enable bluetooth.service

echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

useradd -m -G wheel -s /bin/bash "${3}"
echo "${3}:${4}" | chpasswd
chsh -s "$(which zsh)" "${3}"
echo "" > /home/${3}/.zshrc

echo "Pre-Installation Finish, Installing yay now"
ai3_path=/home/${3}/arch_install3.sh
sed '1,/^#part3$/d' arch_install2.sh > $ai3_path
chown ${3}:${3} $ai3_path
chmod +x $ai3_path
su -c $ai3_path -s /bin/zsh ${3}
exit

#part3
printf '\033c'
cd $HOME
git clone "https://aur.archlinux.org/yay.git"
cd $HOME/yay
makepkg -si --noconfirm

dialog --no-cancel \
        --title "Dotfiles" \
        --menu "Install dotfiles ?" 15 60 4 \
        1 "No" \
        2 "Yes"  2> dfiles

dfiles=$(cat dfiles) && rm dfiles

if [ "$dfiles" -eq 2 ]; then

  DOTFILES="/home/$(whoami)/.dotfiles"
  if [ ! -d "$DOTFILES" ];
      then
            git clone --recurse-submodules "https://github.com/pankajadhyapak/arch_dotfiles" "$DOTFILES" >/dev/null
  fi

  source "/home/$(whoami)/.dotfiles/zsh/.zshenv"
  cd "$DOTFILES"
  bash install.sh

  echo "Done!! reboot now"

  exit

fi


yay -S --noconfirm neofetch
neofetch
echo "Done!! reboot now"
exit