#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS IAM"
Write-Output "IAM INSTANCE PROFILE CREATION AND ADD ROLE"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$instanceProfileName = "instanceProfileEdn1"
$roleName = "roleServiceEdn1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o perfil de instância de nome $instanceProfileName"
    if ((aws iam list-instance-profiles --query "InstanceProfiles[?InstanceProfileName=='$instanceProfileName'].InstanceProfileName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe o perfil de instância de nome $instanceProfileName"
        aws iam list-instance-profiles --query "InstanceProfiles[?InstanceProfileName=='$instanceProfileName'].InstanceProfileName" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os perfis de instância existentes"
        aws iam list-instance-profiles --query 'InstanceProfiles[].InstanceProfileName' --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o perfil de instância de nome $instanceProfileName"
        aws iam create-instance-profile --instance-profile-name $instanceProfileName

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Adicionando a role $roleName ao perfil de instância de nome $instanceProfileName"
        aws iam add-role-to-instance-profile --instance-profile-name $instanceProfileName --role-name $roleName
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o perfil de instância de nome $instanceProfileName"
        aws iam list-instance-profiles --query "InstanceProfiles[?InstanceProfileName=='$instanceProfileName'].InstanceProfileName" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS IAM"
Write-Output "IAM INSTANCE PROFILE EXCLUSION AND REMOVE ROLE"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$instanceProfileName = "instanceProfileEdn1"
$roleName = "roleServiceEdn1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o perfil de instância de nome $instanceProfileName"
    if ((aws iam list-instance-profiles --query "InstanceProfiles[?InstanceProfileName=='$instanceProfileName'].InstanceProfileName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os perfis de instância existentes"
        aws iam list-instance-profiles --query 'InstanceProfiles[].InstanceProfileName' --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo a role $roleName do perfil de instância de nome $instanceProfileName"
        aws iam remove-role-from-instance-profile --instance-profile-name $instanceProfileName --role-name $roleName

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo o perfil de instância de nome $instanceProfileName"
        aws iam delete-instance-profile --instance-profile-name $instanceProfileName

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os perfis de instância existentes"
        aws iam list-instance-profiles --query 'InstanceProfiles[].InstanceProfileName' --output text
    } else {Write-Output "Não existe o perfil de instância de nome $instanceProfileName"}
} else {Write-Host "Código não executado"}