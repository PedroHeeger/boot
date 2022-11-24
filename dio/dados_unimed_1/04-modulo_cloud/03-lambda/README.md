# 3-Desenvolvendo Soluções Serverless na AWS (8)
# 3.3-Backend serverless com AWS Lambda (3)
# 3.3.3-Adicionando layers a uma função Lambda

## Comandos Inicias:
### Atualizando os pacotes
```
sudo apt-get update -y & sudo apt-get upgrade -y
```

### Instalando o nodejs, o npm, o zip e o unzip
```
sudo apt install nodejs -y
sudo apt install npm -y
sudo apt install zip -y
sudo apt install unzip -y
```

### Verificando as versões do nodejs, npm, zip e unzip
```
nodejs -v
npm -v
zip -v
unzip -v
```

## Criando o arquivo para upload na criação do layer na AWS Lambda
### Instalando o jwt-decode
Deve ser feito na pasta do desafio de lambda, **03-lambda**.
```
npm install jwt-decode ~/study/boot/dio/dados_unimed_1/04-modulo_cloud/03-lambda
```

### Verificando se foi instalado na pasta
```
ls
```

### Criando uma pasta para receber o node_modules
```
mkdir nodejs
```

### Movendo o node_modules para pasta
```
mv node_modules nodejs
```

### Criando um arquivo zip da pasta
```
zip -r my_layer.zip nodejs
```

Agora, é necessário fazer o upload do arquivo zipado na criação da Layer.