vim /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel linux linux-firmware vim networkmanager
genfstab -U -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt
cd /tmp
wget https://raw.githubusercontent.com/darkvictor13/install-arch/master/install.sh
chmod -x install.sh
