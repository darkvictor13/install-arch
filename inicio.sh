#!/bin/bash

echo "Crie o boot, swap, e /, nessa ordem"
sleep 5

cfdisk -L

mkfs.ext /dev/sda1
echo "Fiz fs do boot"
mkfs.ext /dev/sda3
echo "Fiz fs do /"
mkswap /dev/sda2
swapon /dev/sda2
echo "Fiz a swap"

mount /dev/sda3 /mnt
echo "Montei o /"
mkdir /mnt/boot
echo "criei a pasta boot"
mount /dev/sda1 /mnt/boot
echo "montei o boot"

vim /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel linux linux-firmware vim networkmanager wget git

genfstab -U -p /mnt >> /mnt/etc/fstab
echo "fiz fstab"

#cd /mnt || exit
#wget https://raw.githubusercontent.com/darkvictor13/install-arch/master/install.sh
#chmod -x install.sh
arch-chroot /mnt
