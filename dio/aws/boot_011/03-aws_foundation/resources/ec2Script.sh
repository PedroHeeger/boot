#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
cd /home/ubuntu

sudo apt-get install nano wget curl unzip npm git -y

curl -sL https://deb.nodesource.com/setup_20.x | sudo bash -
sudo apt-get install zsh nodejs -y
chsh -s /usr/bin/zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --path=$HOME"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

npm install -g npm@latest
npm install -g n
npm i -g serverless



# Instalando o framework severless
serverless







# sudo apt-get install apache2 php7.4 libapache2-mod-php7.4 php7.4-common php7.4-curl php7.4-intl php7.4-mbstring php7.4-json php7.4-xmlrpc php7.4-soap php7.4-mysql php7.4-gd php7.4-xml php7.4-cli php7.4-zip wget mysql-client unzip git binutils ruby -y
# sudo systemctl start apache2
# sudo systemctl enable apache2
# sudo systemctl restart apache2
# wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
# chmod +x ./install
# sudo ./install auto
# sudo service codedeploy-agent start
# sudo chmod 777 /etc/init.d/codedeploy-agent
# sudo wget https://s3.sa-east-1.amazonaws.com/pages.cloudtreinamentos.com/aws/bootcamp/Bootcamp9.zip 
# sudo unzip -o Bootcamp9.zip -d /var/www/html/
# sudo rm /var/www/html/index.html
# sudo chmod -R 777 /var/www/html