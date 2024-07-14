#!/bin/bash

echo "***********************************************"
echo "LINUX TOOLS INSTALLATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Atualizando os pacotes"
sudo yum update -y

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Atualizando o sistema"
sudo yum upgrade -y

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Instalando pacotes"
sudo yum install -y nano vim curl wget unzip zip git




echo "***********************************************"
echo "MYSQL CLIENT INSTALLATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Atualizando os pacotes"
sudo yum update -y

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Atualizando o sistema"
sudo yum upgrade -y

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Baixando o pacote do site do MySQL"
sudo wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Instalando o pacote, que configura o repositório oficial do MySQL no sistema"
sudo dnf install mysql80-community-release-el9-1.noarch.rpm

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Importando a chave GPG do MySQL para verificar a autenticidade dos pacotes que serão baixados do repositório do MySQL"
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Atualizando os pacotes"
sudo yum update -y

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Instalando o pacote, que contém o servidor MySQL, suas dependências e configurações padrão"
sudo dnf install mysql-community-server