#!/bin/bash

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Executando o script como usuario Ubuntu"
sudo -u ubuntu -i /bin/bash <<EOF
sudo apt-get update -y
sudo apt-get upgrade -y

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Instalando pacotes"
sudo apt-get install nano wget curl unzip git zsh -y

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo o shell padrao"
sudo chsh -s /usr/bin/zsh ubuntu

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variaveis"
HOME_UBUNTU="/home/ubuntu" 
ZSH_CUSTOM="$HOME_UBUNTU/.oh-my-zsh/custom"
ZDOTDIR="$HOME_UBUNTU"
export HOME_UBUNTU="/home/ubuntu"
export ZSH_CUSTOM="$HOME_UBUNTU/.oh-my-zsh/custom"
export ZDOTDIR="$HOME_UBUNTU"
echo "$HOME_UBUNTU"
echo "$ZSH_CUSTOM"
echo "$ZDOTDIR"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Baixando o srcipt de instalacao do Oh My ZShell"
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o oh-my-zsh-install.sh
echo "Executando o srcipt de instalação do Oh My ZShell"
sh oh-my-zsh-install.sh --unattended --path=$HOME_UBUNTU
echo "Removendo o srcipt de instalação do Oh My ZShell"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Baixando e configurando a extensao Power Level 10k"
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME_UBUNTU/.oh-my-zsh/custom}/themes/powerlevel10k
sudo echo "Adiciona os comandos ao arquivo ~/.zshrc"
sudo echo "ZSH_THEME=powerlevel10k/powerlevel10k" | sudo tee -a ${ZDOTDIR:-$HOME_UBUNTU}/.zshrc
sudo echo "typeset -g POWERLEVEL9K_INSTANT_PROMPT=off" | sudo tee -a ${ZDOTDIR:-$HOME_UBUNTU}/.zshrc

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Baixando e configurando a extensao ZSH Auto Suggestions"
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME_UBUNTU/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo echo "source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" | sudo tee -a ${ZDOTDIR:-$HOME_UBUNTU}/.zshrc

echo "Baixando e configurando a extensao ZSH Syntax Highlighting"
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-$HOME_UBUNTU/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sudo echo "source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" | sudo tee -a ${ZDOTDIR:-$HOME_UBUNTU}/.zshrc

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Indicando que esse Shell deve ser iniciado"
echo "zsh" >> /home/ubuntu/.bashrc

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Baixando e instalando o pacote AWS CLI"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Baixando pacote Nodejs versão 20.x"
curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash -

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Instalando o Nodejs v20 e o NPM v10.1.0"
sudo apt-get install nodejs -y
sudo apt-get install npm -y
sudo npm install -g npm@10.1.0

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Instalando o framework Serverless"
sudo npm i -g serverless

echo "Instalando as bibliotecas de JavaScript (Node.js)"
sudo npm i uuid aws-sdk

IP = aws ec2 describe-instances --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
echo "$IP"
EOF




# Iniciando a configuração do PowerLevel 10k
# p10k config


# Instalando o framework severless
# serverless

# echo "-----//-----//-----//-----//-----//-----//-----"
# echo "Baixando e configurando a extensao Power Level 10k"
# sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME_UBUNTU/.oh-my-zsh/custom}/themes/powerlevel10k
# sudo echo "Adiciona os comandos ao arquivo ~/.zshrc"
# sudo echo "ZSH_THEME=powerlevel10k/powerlevel10k" >> ${ZDOTDIR:-$HOME_UBUNTU}/.zshrc
# sudo echo "typeset -g POWERLEVEL9K_INSTANT_PROMPT=off" >> ${ZDOTDIR:-$HOME_UBUNTU}/.zshrc

# echo "-----//-----//-----//-----//-----//-----//-----"
# echo "Baixando e configurando a extensao ZSH Auto Suggestions"
# sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME_UBUNTU/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# sudo echo "source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME_UBUNTU}/.zshrc

# echo "Baixando e configurando a extensao ZSH Syntax Highlighting"
# sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-$HOME_UBUNTU/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# sudo echo "source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME_UBUNTU}/.zshrc

# echo "-----//-----//-----//-----//-----//-----//-----"
# echo "Atualizando o NPM e o Nodejs"
# npm install -g npm@latest
# npm install -g n


# Definindo o shell padrão para usuário ubuntu
# chsh -s /usr/bin/zsh
# sudo chsh -s /usr/bin/zsh ubuntu
# chsh -s /usr/bin/zsh ubuntu

# Iniciando um novo shell ZSh no usuário ubuntu
# sudo -u ubuntu -i /bin/zsh

# # Iniciando um novo shell ZSh no usuário ubuntu
# sudo -u ubuntu -i /bin/zsh

# # Definindo o shell padrão para usuário ubuntu
# sudo chsh -s /usr/bin/zsh ubuntu


# rm oh-my-zsh-install.sh

# sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)  --unattended --path=/home/ubuntu"
# echo "SEGUNDA TENTATIVA"
# sudo sh -c "export CHSH='no'; $(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --path=$HOME_UBUNTU" || true
# echo "TERCEIRA TENTATIVA"
# sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
# echo "QUARTA TENTATIVA"
# sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended" || true