sudo pacman -S vim cmake
echo "Insira o caminho aonde vc clonou os dot files a partir da home"
echo -e "Exemplo se vc colocou em ~/Documents/.dot-files\nInsira Documents"
read diretorio
ln -s ~/$diretorio/.dotfiles/.vimrc ~/.vimrc
ln -s ~/$diretorio/.dotfiles/.vim ~/.vim
