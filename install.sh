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
echo "Agora vamos colocar a senha do root"
passwd
# trecho adaptado do codigo do terminalroot
echo "Agora vamos criar um usuario e incluir no grupo sudo!" 
echo "Informe seu nome de usuario" 
read nome
muser=$(echo "$nome" | tr -d ' _-' | tr 'A-Z' 'a-z')

echo "Seu usuario(Com nome corrigido) = $muser. Entre e repita sua senha:"
useradd -m -g users -G wheel,storage,power,video,network -s /bin/bash "$muser"
passwd "$muser"
sed -i "s/^root ALL=(ALL) ALL$/root ALL=(ALL) ALL\n${muser} ALL=(ALL) ALL\n/" /etc/sudoers
echo "exec i3" > /home/${muser}/.xinitrc
#############################################################################
#pacman -S reflector
#reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

# Grub legacy
#pacman -S grub amd-ucode
#grub-install --target=i386-pc --recheck /dev/sda
#mkdir /boot/grub/locale
#touch /boot/grub/locale/en.mo
#cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo

#grub UEFI
pacman -S grub-efi-x86_64 efibootmgr amd-ucode
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --recheck
mkdir /boot/grub/locale
touch /boot/grub/locale/en.mo
cp /usr/share/locale/en@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo


grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
