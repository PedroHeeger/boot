#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS IAM"
Write-Output "IAM USER CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$iamUserName = "iamUserEdn1"
$userPassword = "SenhaTest123"
$tagNameIamUser = "Demo Account"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o usuário do IAM de nome $iamUserName"
    if ((aws iam list-users --query "Users[?UserName=='$iamUserName'].UserName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe um usuário do IAM de nome $iamUserName"
        aws iam list-users --query "Users[?UserName=='$iamUserName'].UserName" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os usuários do IAM criados"
        aws iam list-users --query "Users[].UserName" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o usuário do IAM de nome $iamUserName"
        aws iam create-user --user-name $iamUserName

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando um perfil de login do usuário do IAM de nome $iamUserName"
        aws iam create-login-profile --user-name $iamUserName --password $userPassword --password-reset-required

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Adicionando uma tag de nome para o usuário do IAM de nome $iamUserName"
        aws iam tag-user --user-name $iamUserName --tags "Key=Name,Value=$tagNameIamUser"

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o usuário do IAM de nome $iamUserName"
        aws iam list-users --query "Users[?UserName=='$iamUserName'].UserName" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS IAM"
Write-Output "IAM USER EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$iamUserName = "iamUserEdn1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o usuário do IAM de nome $iamUserName"
    if ((aws iam list-users --query "Users[?UserName=='$iamUserName'].UserName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os usuários do IAM criados"
        aws iam list-users --query "Users[].UserName" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo o perfil de login do usuário do IAM de nome $iamUserName"
        aws iam delete-login-profile --user-name $iamUserName

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo o usuário do IAM de nome $iamUserName"
        aws iam delete-user --user-name $iamUserName

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os usuários do IAM criados"
        aws iam list-users --query "Users[].UserName" --output text
    } else {Write-Output "Não existe o usuário do IAM de nome $iamUserName"}
} else {Write-Host "Código não executado"}