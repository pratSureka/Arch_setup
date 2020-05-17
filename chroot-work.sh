#!/bin/bash
set -e

echo "Setting Timezone"
echo "ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime"
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

echo "Setting Clock"
echo "hwclock --systohc"
hwclock --systohc

echo " Setting localization"
echo "echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen"
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen

echo "Setting local.conf"
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo "Setting Hostname"
echo "dopeduck" >> /etc/hostname

echo "Dowlonading Grub"
echo "pacman -S grub os-prober efibootmgr"
pacman -S grub os-prober efibootmgr

echo "installing Grub"
echo "mkdir /boot/efi && grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub"
mkdir /boot/efi && grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub

echo "Making Grub-config"
echo "grub-mkconfig -o /boot/grub/grub.cfg"
grub-mkconfig -o /boot/grub/grub.cfg

echo "Please Add users and setup root password yourself"
