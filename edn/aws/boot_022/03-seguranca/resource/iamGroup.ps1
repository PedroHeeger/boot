#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS IAM"
Write-Output "IAM GROUP CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$iamGroupName = "iamGroupEdn1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o grupo de nome $iamGroupName"
    if ((aws iam list-groups --query "Groups[?GroupName=='$iamGroupName'].GroupName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe o grupo de nome $iamGroupName"
        aws iam list-groups --query "Groups[?GroupName=='$iamGroupName'].GroupName" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os grupos criados"
        aws iam list-groups --query 'Groups[].GroupName' --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o grupo de nome $iamGroupName"
        aws iam create-group --group-name $iamGroupName

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o grupo de nome $iamGroupName"
        aws iam list-groups --query "Groups[?GroupName=='$iamGroupName'].GroupName" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS IAM"
Write-Output "IAM GROUP EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$iamGroupName = "iamGroupEdn1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o grupo de nome $iamGroupName"
    if ((aws iam list-groups --query "Groups[?GroupName=='$iamGroupName'].GroupName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os grupos criados"
        aws iam list-groups --query 'Groups[].GroupName' --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo o grupo de nome $iamGroupName"
        aws iam delete-group --group-name $iamGroupName

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os grupos criados"
        aws iam list-groups --query 'Groups[].GroupName' --output text
    } else {Write-Output "Não existe o grupo de nome $iamGroupName"}
} else {Write-Host "Código não executado"}