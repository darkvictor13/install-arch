echo "Insira o caminho aonde vc clonou os dot files a partir da home"
echo -e "Exemplo se vc colocou em ~/Documents/.dot-files\nInsira Documents"
read diretorio
ln -s ~/$diretorio ~/Dasafio.cpp
