#!/bin/bash

echo "Iniciando o processo..."
echo "Criando os diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando os grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando os usuários..."

useradd -m carlos -c "Carlos" -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_ADM
useradd -m maria -c "Maria" -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_ADM
useradd -m joao_ -c "João" -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_ADM

useradd -m debora -c "Débora" -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_VEN
useradd -m sebastiana -c "Sebastiana" -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_VEN
useradd -m roberto -c "Roberto" -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_VEN

useradd -m josefina -c "Josefina" -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_SEC
useradd -m amanda -c "Amanda" -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_SEC
useradd -m rogerio -c "Rogério" -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_SEC

echo "Concedendo permissões..."

chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

echo "Processo finalizado com sucesso!"