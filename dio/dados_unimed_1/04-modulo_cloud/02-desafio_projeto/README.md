* **Plataforma**: [DIO (Digital Inovation One)](/dio/)
* **Bootcamp**: [Geração Tech Unimed-BH - Ciência de Dados: Básico; 126 Hrs](/dio/dados_unimed_1/)
* **Módulo_Bootcamp**: [4) Imersão Cloud Computer (6)](/dio/dados_unimed_1/04-modulo_cloud)

# 4.2) Desafio de projeto: Boas práticas com DynamoDB (12)
## Objetivos
Nesta live vamos conhecer um pouco sobre o DynamoDB, um serviço de banco de dados NoSQL gerenciado da AWS, também vamos explorar boas práticas de modelagem, otimização de desempenho e custos, além de criar tabelas e realizar queries de pesquisa.
## Tecnologias
* Linguagem de Programação: Python
* Ambiente de Desenvolvimento: VS Code; Terminal do Linux; Cloud AWS
* Ferramentas da AWS: DynamoDB
* Ferramentas Linux: curl, uzip, amazon CLI

<a id="ancora"></a>
## Índice
* 4.2.1.1) Como usar os desafios de projeto para criar seu portfolio
* 4.2.1.2) Introdução e explicação do Desafio
* 4.2.1.3) DB Relacional x DB Não Relacional
* 4.2.1.4) Introdução ao DynamoDB
* 4.2.1.5) Componentes e Boas Práticas com DynamoDB
* 4.2.1.6) Pensando fora da caixa no DynamoDB
* 4.2.1.7) Mãos à obra: Observando a Arquitetura da prática
* [4.2.1.8) Configurando o AWS e Criando uma Tabela](#ancora1)
* [4.2.1.9) Inserindo Itens na Tabela](#ancora2)
* [4.2.1.10) Criando Index](#ancora3)
* [4.2.1.11) Finalizando o Projeto](#ancora4)
* 4.2.1.12) Entendendo o Desafio

## Desenvolvimento
Nesta pasta **02-desafio_projeto** está contida a pasta **src** contendo os arquivos csvs com os dados que serão inseridos no DynamoDB.

----------------------------------------------------------------------------------------------
<a id="ancora1"></a>
### 4.2.1.8) Configurando o AWS e Criando uma Tabela
[voltar](#ancora)   

#### Comandos Inicias:
* Atualizando os pacotes
```
sudo apt-get update -y & sudo apt-get upgrade -y
```
* Instalando o unzip e curl
```
sudo apt-get install unzip -y
sudo apt-get install curl -y
```
* Verificando as versões do unzip e curl
```
unzip -v
curl -v
```
* Instalando o Amazon CLI
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
```
* Configurando as credenciais de acesso     
Conferir AWS Access Key ID e AWS Secret Access Key no arquivo csv com as credenciais do IAM User
```
aws configure
```

#### Comandos para execução do experimento (DynamoDB):
* Criando uma tabela
```
aws dynamodb create-table \
    --table-name Music \
    --attribute-definitions \
        AttributeName=Artist,AttributeType=S \
        AttributeName=SongTitle,AttributeType=S \
    --key-schema \
        AttributeName=Artist,KeyType=HASH \
        AttributeName=SongTitle,KeyType=RANGE \
    --provisioned-throughput \
        ReadCapacityUnits=10,WriteCapacityUnits=5
```

----------------------------------------------------------------------------------------------
<a id="ancora2"></a>
### 4.2.1.9) Inserindo Itens na Tabela
[voltar](#ancora) 

* Inserindo um item
```
aws dynamodb put-item \
    --table-name Music \
    --item file://src/itemmusic.json \
```
* Inserindo múltiplos itens
```
aws dynamodb batch-write-item \
    --request-items file://sr/batchmusic.json
```

----------------------------------------------------------------------------------------------
<a id="ancora3"></a> 
### 4.2.1.10) Criando Index
[voltar](#ancora) 

* Criando um index global secundário baseado no título do álbum
```
aws dynamodb update-table \
    --table-name Music \
    --attribute-definitions AttributeName=AlbumTitle,AttributeType=S \
    --global-secondary-index-updates \
        "[{\"Create\":{\"IndexName\": \"AlbumTitle-index\",\"KeySchema\":[{\"AttributeName\":\"AlbumTitle\",\"KeyType\":\"HASH\"}], \
        \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
```
* Criando um index global secundário baseado no nome do artista e no título do álbum
```
aws dynamodb update-table \
    --table-name Music \
    --attribute-definitions\
        AttributeName=Artist,AttributeType=S \
        AttributeName=AlbumTitle,AttributeType=S \
    --global-secondary-index-updates \
        "[{\"Create\":{\"IndexName\": \"ArtistAlbumTitle-index\",\"KeySchema\":[{\"AttributeName\":\"Artist\",\"KeyType\":\"HASH\"}, {\"AttributeName\":\"AlbumTitle\",\"KeyType\":\"RANGE\"}], \
        \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
```
* Criando um index global secundário baseado no título da música e no ano
```
aws dynamodb update-table \
    --table-name Music \
    --attribute-definitions\
        AttributeName=SongTitle,AttributeType=S \
        AttributeName=SongYear,AttributeType=S \
    --global-secondary-index-updates \
        "[{\"Create\":{\"IndexName\": \"SongTitleYear-index\",\"KeySchema\":[{\"AttributeName\":\"SongTitle\",\"KeyType\":\"HASH\"}, {\"AttributeName\":\"SongYear\",\"KeyType\":\"RANGE\"}], \
        \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5},\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
```

----------------------------------------------------------------------------------------------
<a id="ancora4"></a>
### 4.2.1.11) Finalizando o Projeto (Consultas)
[voltar](#ancora) 
 
* Pesquisando item por artista
```
aws dynamodb query \
    --table-name Music \
    --key-condition-expression "Artist = :artist" \
    --expression-attribute-values  '{":artist":{"S":"Iron Maiden"}}'
```
* Pesquisando pelo index secundário baseado no título do álbum
```
aws dynamodb query \
    --table-name Music \
    --index-name AlbumTitle-index \
    --key-condition-expression "AlbumTitle = :name" \
    --expression-attribute-values  '{":name":{"S":"Fear of the Dark"}}'
```
* Pesquisando pelo index secundário baseado no nome do artista e no título do álbum
```
aws dynamodb query \
    --table-name Music \
    --index-name ArtistAlbumTitle-index \
    --key-condition-expression "Artist = :v_artist and AlbumTitle = :v_title" \
    --expression-attribute-values  '{":v_artist":{"S":"Iron Maiden"},":v_title":{"S":"Fear of the Dark"} }'
```
* Pesquisando pelo index secundário baseado no título da música e no ano
```
aws dynamodb query \
    --table-name Music \
    --index-name SongTitleYear-index \
    --key-condition-expression "SongTitle = :v_song and SongYear = :v_year" \
    --expression-attribute-values  '{":v_song":{"S":"Wasting Love"},":v_year":{"S":"1992"} }'
```
* Pesquisando item por artista e título da música com utilização de um arquivo JSON
```
aws dynamodb query \
    --table-name Music \
    --key-condition-expression "Artist = :artist and SongTitle = :title" \
    --expression-attribute-values file://src/keyconditions.json
```