#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS IAM"
Write-Output "IAM USER ADD GROUP"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$iamGroupName = "iamGroupEdn1"
$iamUserName = "iamUserEdn1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o usuário do IAM $iamUserName no grupo $iamGroupName"
    if ((aws iam get-group --group-name $iamGroupName --query "Users[?UserName=='$iamUserName'].UserName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe um usuário do IAM de nome $iamUserName no grupo $iamGroupName"
        aws iam get-group --group-name $iamGroupName --query "Users[?UserName=='$iamUserName'].UserName" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os usuários do IAM do grupo $iamGroupName"
        aws iam get-group --group-name $iamGroupName --query "Users[].UserName" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Adicionando o usuário do IAM de nome $iamUserName ao grupo $iamGroupName"
        aws iam add-user-to-group --user-name $iamUserName --group-name $iamGroupName

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o usuário de nome $iamUserName no grupo $iamGroupName"
        aws iam get-group --group-name $iamGroupName --query "Users[?UserName=='$iamUserName'].UserName" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS IAM"
Write-Output "IAM USER REMOVE GROUP"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$iamGroupName = "iamGroupEdn1"
$iamUserName = "iamUserEdn1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o usuário do IAM $iamUserName no grupo $iamGroupName"
    if ((aws iam get-group --group-name $iamGroupName --query "Users[?UserName=='$iamUserName'].UserName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os usuários do IAM do grupo $iamGroupName"
        aws iam get-group --group-name $iamGroupName --query "Users[].UserName" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo o usuário do IAM $iamUserName do grupo $iamGroupName"
        aws iam remove-user-from-group --user-name $iamUserName --group-name $iamGroupName

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os usuários do IAM do grupo $iamGroupName"
        aws iam get-group --group-name $iamGroupName --query "Users[].UserName" --output text
    } else {Write-Output "Não existe o usuário do IAM $iamUserName no grupo $iamGroupName"}
} else {Write-Host "Código não executado"}