# arch
sudo pacman -S vim cmake
# para ubuntu descomente a linha debaixoi, comente a de cima
sudo apt-get build-essential install cmake vim
echo "Insira o caminho aonde vc clonou os dot files a partir da home"
echo "Exemplo se vc colocou em ~/Documents/.dot-files"
echo "Insira [Documents]"
read diretorio
ln -s ~/$diretorio/.dotfiles/.vimrc ~/.vimrc
ln -s ~/$diretorio/.dotfiles/.vim ~/.vim
cd ~/.vim
git submodule update --init --recursive
cd bundle/YouCompleteMe
python3 install.py --clangd-completer
