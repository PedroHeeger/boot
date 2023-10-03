#!/bin/bash

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Executando o script como usuario Ubuntu"
cd /home/ubuntu
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
echo "Usuario atual: $(whoami)"
export HOME="/home/ubuntu"
export ZSH_CUSTOM="/home/ubuntu/.oh-my-zsh/custom"
echo "$HOME"
echo "$ZSH_CUSTOM"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Baixando o srcipt de instalacao do Oh My ZShell"
echo "$(pwd)"
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o oh-my-zsh-install.sh
echo "Executando o srcipt de instalacao do Oh My ZShell"
sh oh-my-zsh-install.sh --unattended --path=$HOME
echo "Removendo o srcipt de instalacao do Oh My ZShell"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Baixando e configurando a extensao Power Level 10k"
sudo -E git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "Adiciona o comando typeset do PowerLevel"
sudo -E echo "typeset -g POWERLEVEL9K_INSTANT_PROMPT=off" | sudo -E tee -a ${ZDOTDIR:-$HOME}/.zshrc

echo "Alterando o theme do Oh My ZShell para PowerLevel10k se existir o arquivo .zshrc"
if [ -f "$rc_file" ]; then
  # Faz a substituição no arquivo usando o sed
  sed -i 's#ZSH_THEME=.*#ZSH_THEME="powerlevel10k/powerlevel10k"#' $HOME/.zshrc
else
  echo "O arquivo $rc_file não existe."
fi

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Baixando e configurando a extensao ZSH Auto Suggestions"
sudo -E git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo -E echo "source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" | sudo -E tee -a ${ZDOTDIR:-$HOME}/.zshrc

echo "Baixando e configurando a extensao ZSH Syntax Highlighting"
sudo -E git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sudo -E echo "source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" | sudo -E tee -a ${ZDOTDIR:-$HOME}/.zshrc

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