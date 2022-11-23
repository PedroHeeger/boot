# 2-Desafio de projeto: Boas práticas com DynamoDB (12)
# 2.1-Desafio de projeto: Boas práticas com DynamoDB
# 2.1.8-Configurando o AWS e Criando uma Tabela

## Comandos Inicias:
### Atualizando os pacotes e instalando o unzip e curl
```
sudo apt-get update & sudo apt-get upgrade
sudo apt-get install unzip
sudo apt-get install curl
```

### Instalando o Amazon CLI
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
```

### Configurando as credenciais de acesso
Conferir AWS Access Key ID e AWS Secret Access Key no arquivo csv com as credenciais do IAM User
```
aws configure
```
----------------------------------------------------------------------------------------------
## Comandos para execução do experimento (DynamoDB):
### Criar uma tabela:
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

----------------------------------------------------------------------------------------------
### Inserção:
#### Inserir um item:
```
aws dynamodb put-item \
    --table-name Music \
    --item file://src/itemmusic.json \
```

#### Inserir múltiplos itens:
```
aws dynamodb batch-write-item \
    --request-items file://batchmusic.json
```

----------------------------------------------------------------------------------------------
### Criando Índices:
#### Criar um index global secundário baeado no título do álbum:
```
aws dynamodb update-table \
    --table-name Music \
    --attribute-definitions AttributeName=AlbumTitle,AttributeType=S \
    --global-secondary-index-updates \
        "[{\"Create\":{\"IndexName\": \"AlbumTitle-index\",\"KeySchema\":[{\"AttributeName\":\"AlbumTitle\",\"KeyType\":\"HASH\"}], \
        \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
```

#### Criar um index global secundário baseado no nome do artista e no título do álbum:
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

#### Criar um index global secundário baseado no título da música e no ano:
```
aws dynamodb update-table \
    --table-name Music \
    --attribute-definitions\
        AttributeName=SongTitle,AttributeType=S \
        AttributeName=SongYear,AttributeType=S \
    --global-secondary-index-updates \
        "[{\"Create\":{\"IndexName\": \"SongTitleYear-index\",\"KeySchema\":[{\"AttributeName\":\"SongTitle\",\"KeyType\":\"HASH\"}, {\"AttributeName\":\"SongYear\",\"KeyType\":\"RANGE\"}], \
        \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
```

----------------------------------------------------------------------------------------------
### Consultas
#### Pesquisar item por artista:
```
aws dynamodb query \
    --table-name Music \
    --key-condition-expression "Artist = :artist" \
    --expression-attribute-values  '{":artist":{"S":"Iron Maiden"}}'
```

#### Pesquisar item por artista e título da música:
```
aws dynamodb query \
    --table-name Music \
    --key-condition-expression "Artist = :artist and SongTitle = :title" \
    --expression-attribute-values file://src/keyconditions.json
```

#### Pesquisa pelo index secundário baseado no título do álbum:
```
aws dynamodb query \
    --table-name Music \
    --index-name AlbumTitle-index \
    --key-condition-expression "AlbumTitle = :name" \
    --expression-attribute-values  '{":name":{"S":"Fear of the Dark"}}'
```

#### Pesquisa pelo index secundário baseado no nome do artista e no título do álbum:
```
aws dynamodb query \
    --table-name Music \
    --index-name ArtistAlbumTitle-index \
    --key-condition-expression "Artist = :v_artist and AlbumTitle = :v_title" \
    --expression-attribute-values  '{":v_artist":{"S":"Iron Maiden"},":v_title":{"S":"Fear of the Dark"} }'
```

#### Pesquisa pelo index secundário baseado no título da música e no ano:
```
aws dynamodb query \
    --table-name Music \
    --index-name SongTitleYear-index \
    --key-condition-expression "SongTitle = :v_song and SongYear = :v_year" \
    --expression-attribute-values  '{":v_song":{"S":"Wasting Love"},":v_year":{"S":"1992"} }'
```