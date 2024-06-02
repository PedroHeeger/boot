#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON DYNAMODB"
Write-Output "TABLE CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$tableName = "ednProductCatalog"
$attributeName = "Id"
$attributeType = "S"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe a tabela de nome $tableName"
    if ((aws dynamodb list-tables --query "TableNames[?@=='$tableName']" --output text).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe a tabela de nome $tableName"
        aws dynamodb list-tables --query "TableNames[?@=='$tableName']" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todas as tabelas criadas"
        aws dynamodb list-tables --query "TableNames" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando a tabela de nome $tableName"
        aws dynamodb create-table --table-name $tableName --attribute-definitions "AttributeName=$attributeName,AttributeType=$attributeType" --key-schema "AttributeName=$attributeName,KeyType=HASH" --provisioned-throughput "ReadCapacityUnits=5,WriteCapacityUnits=5" --no-cli-pager
        
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando a tabela de nome $tableName"
        aws dynamodb list-tables --query "TableNames[?@=='$tableName']" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON DYNAMODB"
Write-Output "TABLE EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$tableName = "ednProductCatalog"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe a tabela de nome $tableName"
    if ((aws dynamodb list-tables --query "TableNames[?@=='$tableName']" --output text).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todas as tabelas criadas"
        aws dynamodb list-tables --query "TableNames" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo a tabela de nome $tableName"
        aws dynamodb delete-table --table-name $tableName --no-cli-pager

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todas as tabelas criadas"
        aws dynamodb list-tables --query "TableNames" --output text
    } else {Write-Output "Não existe a tabela de nome $tableName"}
} else {Write-Host "Código não executado"}