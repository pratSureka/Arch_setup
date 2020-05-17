#!/bin/bash
set -e

echo "Syncing"
echo "sudo pacman -Sy"
sudo pacman -Syyu

echo "Installing reflector"
echo "sudo pacman -S reflector"
sudo pacman -S reflector

echo "Setting up mirrors"
echo "reflector -c "India" -f 5 -l 5 -n 5 --save /etc/pacman.d/mirrorlist"
reflector -c "India" -f 5 -l 5 -n 5 --save /etc/pacman.d/mirrorlist

echo "Installing System"
echo "pacstrap /mnt base base-devel linux-zen linux-firmware dhcpcd wpa_supplicant"
pacstrap /mnt base base-devel linux-zen linux-firmware dhcpcd wpa_supplicant

echo "Setting up fstab"
echo "genfstab -U /mnt >> /mnt/etc/fstab"
genfstab -U /mnt >> /mnt/etc/fstab

echo "Enter arch-chroot"
