ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
echo en_US.UTF-8 UTF-8 >> vim /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
echo -e "Digite seu nome do pc\nObs: sera o nome do pc na rede"
read nome_usuario
echo $nome_usuario > /etc/hostname
echo -e "127.0.0.1\tlocalhost.localdomain\tlocalhost" > /etc/hosts
echo -e "::1\t\tlocalhost.localdomain\tlocalhost" >> /etc/hosts
echo -e "127.0.1.1\t$nome_usuario.localdomain\t$nome_usuario" >> /etc/hosts
passwd
pacman -S grub amd-ucode
grub-install --target=i386-pc --recheck /dev/sda
mkdir /boot/grub/locale
touch /boot/grub/locale/en.mo
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
