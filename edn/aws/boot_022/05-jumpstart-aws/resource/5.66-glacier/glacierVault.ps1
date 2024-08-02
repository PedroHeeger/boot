#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON S3 GLACIER"
Write-Output "VAULT CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$vaultName = "vaultEdn1"
$accountId = "-"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o cofre de nome $vaultName"
    if ((aws glacier list-vaults --account-id $accountId --query "VaultList[?VaultName=='$vaultName'].VaultName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe o cofre de nome $vaultName"
        aws glacier list-vaults --account-id $accountId --query "VaultList[?VaultName=='$vaultName'].VaultName" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os cofres da conta determinada"
        aws glacier list-vaults --account-id $accountId --query "VaultList[].VaultName" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o cofre de nome $vaultName"
        aws glacier create-vault --account-id $accountId --vault-name $vaultName

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o cofre de nome $vaultName"
        aws glacier list-vaults --account-id $accountId --query "VaultList[?VaultName=='$vaultName'].VaultName" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON S3 GLACIER"
Write-Output "VAULT EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$vaultName = "vaultEdn1"
$accountId = "-"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o cofre de nome $vaultName"
    if ((aws glacier list-vaults --account-id $accountId --query "VaultList[?VaultName=='$vaultName'].VaultName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os cofres da conta determinada"
        aws glacier list-vaults --account-id $accountId --query "VaultList[].VaultName" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo o cofre de nome $vaultName"
        aws glacier delete-vault --account-id $accountId --vault-name $vaultName

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os cofres da conta determinada"
        aws glacier list-vaults --account-id $accountId --query "VaultList[].VaultName" --output text
    } else {Write-Output "Não existe o cofre de nome $vaultName"}
} else {Write-Host "Código não executado"}