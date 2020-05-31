echo "Insira o caminho aonde vc clonou os dot files a partir da home"
echo "Exemplo se vc colocou em ~/Documents/.dot-files"
echo "Insira [~/Documents]"
echo "Exemplo se vc colocou em ~/.dot-files"
echo "Insira [~]"
read DIRETORIO
#echo "Deseja fazer os links simbolicos agora[Y/n]"
#read CONTINUA
#if [[ "$CONTINUA" != 'n' || "$CONTINUA" != 'N' ]]; then
#	echo "O programa continuaria"
#else 
#	echo "O programa nao continuaria"
#fi	

sudo su

rm -r ~/.config/i3
ln -s DIRETORIO/.dotfiles/i3 ~/.config/i3

rm -r ~/.config/ranger
ln -s DIRETORIO/.dotfiles/ranger ~/.config/ranger

rm -r ~/.config/termite
ln -s DIRETORIO/.dotfiles/termite ~/.config/termite

rm -r /etc/i3status.conf
ln -s DIRETORIO/.dotfiles/i3status /etc/i3status.conf

rm -r ~/.zshrc
ln -s DIRETORIO/.dotfiles/zshrc ~/.zshrc
