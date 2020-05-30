#!/bin/bash

echo "Crie o boot, swap, e /, nessa ordem"
sleep 5

cfdisk -L

mkfs.ext /dev/sda3 && mount /dev/sda3 /mnt
mkfs.ext /dev/sda1 && mkdir /mnt/boot && mount /dev/sda1 /mnt/boot 
mkswap /dev/sda2 && swapon /dev/sda2

vim /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel linux linux-firmware vim networkmanager wget git

genfstab -U -p /mnt >> /mnt/etc/fstab
echo "fiz fstab"
cat /mnt/etc/fstab

#cd /mnt || exit
#wget https://raw.githubusercontent.com/darkvictor13/install-arch/master/install.sh
#chmod -x install.sh
arch-chroot /mnt
