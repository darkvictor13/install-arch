pacstrap /mnt base base-devel linux linux-firmware vim networkmanager network-manager-applet
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
echo en_US.UTF-8 UTF-8 >> vim /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 >> /etc/locale.conf
echo -e "Digite seu nome de usuario\n"
read nome_usuario
echo $nome_usuario > /etc/hostname
echo -e "127.0.0.1\tlocalhost.localdomain\tlocalhost\n" > /etc/hosts
echo -e "::1\t\tlocalhost.localdomain\tlocalhost\n" >> /etc/hosts
echo -e "127.0.1.1\t$nome_usuario.localdomain\t$nome_usuario\n" >> /etc/hosts
passwd
mkdir /boot/grub/locale
touch /boot/grub/locale/en.mo
pacman -S grub-efi-x86_64 efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --recheck
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
