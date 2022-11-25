* **Plataforma**: [DIO (Digital Inovation One)](/dio/)
* **Bootcamp**: [Geração Tech Unimed-BH - Ciência de Dados: Básico; 126 Hrs](/dio/dados_unimed_1/)
* **Módulo_Bootcamp**: [2) Python para Cientistas de Dados (21)](/dio/dados_unimed_1/02-modulo_python/)

# 4.3) Curso: Desenvolvendo Soluções Serverless na AWS (8)
## Objetivos
* Criar um Stream Delivery com AWS Kinesis Firehose;
* Configurar instância no AWS EC2;
* Gerar logs de processamento de dados com Python;
* Armazenar logs no AWS S3;
* Manipular dados no AWS Glue Data Brew;
## Tecnologias
* Linguagem de Programação: Python
* Ambiente de Desenvolvimento: VS Code; Terminal do Linux; Cloud AWS
* Ferramentas AWS: EC2; S3; Kinesis Firehose; Glue Data Brew
* Ferramentas Linux: curl, zip, uzip, nodejs, npm

<a id="ancora"></a>
## Índice
* 4.3.1) Introdução (1)
    * 4.3.1.1) Introdução
* 4.3.2) O que é serverless (3)
    * 4.3.2.1) O que é serverless?
    * 4.3.2.2) Serverless x Server Computing
    * 4.3.2.3) Recursos serverless na AWS
* [4.3.3) Backend serverless com AWS Lambda (3)](#ancora3)
    * 4.3.3.1) O que é AWS Lambda?
    * 4.3.3.2) Criando a primeira função Lambda
    * [4.3.3.3) Adicionando layers a uma função Lambda](#ancora3.3)
* 4.3.4) NoSQL na Amazon com DynamoDB (5)
    * 4.3.4.1) O que é o NoSQL?
    * 4.3.4.2) O que é o Amazon DynamoDB
    * 4.3.4.3) Criando a primeira tabela no DynamoDB - Parte 1
    * 4.3.4.4) Criando a primeira tabela no DynamoDB - Parte 2
    * 4.3.4.5) Criando a primeira tabela no DynamoDB - Parte 3
* 4.3.5) Trabalhando com arquivos no Amazon S3 (2)
    * 4.3.5.1) O que é o Amazon S3?
    * 4.3.5.2) Criando um bucket no Amazon S3
* 4.3.6) Criando API Rest com o Amazon API Gateway (3)
    * 4.3.6.1) O que é uma API?
    * 4.3.6.2) Conhecendo o Amazon API Gateway
    * 4.3.6.3) Criando uma API REST
* 4.3.7) Construindo nossa aplicação serverless (4)
    * 4.3.7.1) Construindo nossa aplicação serverless - Parte 1
    * 4.3.7.2) Construindo nossa aplicação serverless - Parte 2
    * 4.3.7.3) Construindo nossa aplicação serverless - Parte 3
    * 4.3.7.4) Construindo nossa aplicação serverless - Parte 4
* 4.3.8) Conclusão e revisão geral (3)
    * 4.3.8.1) Conclusão e revisão geral
    * 4.3.8.2) Materiais de apoio
    * 4.3.8.3) Certifique seu conhecimento

<a id="ancora3"></a>
### 4.3.3) Backend serverless com AWS Lambda (3)
[voltar](#ancora) 

<a id="ancora3.3"></a>
#### 4.3.3.3) Adicionando layers a uma função Lambda
[voltar](#ancora) 

##### Comandos Inicias:
* Atualizando os pacotes
```
sudo apt-get update -y & sudo apt-get upgrade -y
```
* Instalando o nodejs, o npm, o zip e o unzip
```
sudo apt install nodejs -y
sudo apt install npm -y
sudo apt install zip -y
sudo apt install unzip -y
```
* Verificando as versões do nodejs, npm, zip e unzip
```
nodejs -v
npm -v
zip -v
unzip -v
```

##### Criando o arquivo para upload na criação do layer na AWS Lambda
* Instalando o jwt-decode
Deve ser feito na pasta do desafio de lambda, **03-lambda**.
```
npm install jwt-decode ~/study/boot/dio/dados_unimed_1/04-modulo_cloud/03-lambda
```
* Verificando se foi instalado na pasta
```
ls
```
* Criando uma pasta para receber o node_modules
```
mkdir nodejs
```
* Movendo o node_modules para pasta
```
mv node_modules nodejs
```
* Criando um arquivo zip da pasta
```
zip -r my_layer.zip nodejs
```

Agora, é necessário fazer o upload do arquivo zipado na criação da Layer.