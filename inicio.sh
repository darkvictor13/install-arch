vim /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel linux linux-firmware vim networkmanager wget git
genfstab -U -p /mnt >> /mnt/etc/fstab

cd /mnt/tmp
wget https://raw.githubusercontent.com/darkvictor13/install-arch/master/install.sh
chmod -x install.sh
arch-chroot /mnt
