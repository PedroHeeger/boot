#!/bin/bash

echo "Iniciando o processo..."
echo "Atualizando o servidor..."

apt-get update -y
apt-get upgrade -y

echo "Instalando o Apache e o Unzip"

apt-get install apache2 -y
apt-get instal unzip -y

echo "Baixando a aplicação do repositório do GitHub..."

cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

echo "Descompactando o arquivo..."

unzip main.zip

echo "Movendo os arquivos da aplicação para o diretório /var/www/html/"

cd linux-site-dio-main
cp -R * /var/www/html/

echo "Processo finalizado, site disponível através do IP da maquina virtual"