#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS IAM"
Write-Output "IAM USER ADD POLICY"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$iamUserName = "iamUserEdn1"
$policyName = "IAMUserChangePassword"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe a policy $policyName no usuário $iamUserName"
    if ((aws iam list-attached-user-policies --user-name $iamUserName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe a policy $policyName no usuário $iamUserName"
        aws iam list-attached-user-policies --user-name $iamUserName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todas as policies do usuário $iamUserName"
        aws iam list-attached-user-policies --user-name $iamUserName --query "AttachedPolicies[].PolicyName" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o ARN da policy $policyName"
        $policyArn = aws iam list-policies --query "Policies[?PolicyName=='$policyName'].[Arn]" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Adicionando a policy $policyName ao usuário $iamUserName"
        aws iam attach-user-policy --user-name $iamUserName --policy-arn $policyArn

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando a policy $policyName do usuário $iamUserName"
        aws iam list-attached-user-policies --user-name $iamUserName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS IAM"
Write-Output "IAM USER REMOVE POLICY"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$iamUserName = "iamUserEdn1"
$policyName = "IAMUserChangePassword"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe a policy $policyName no usuário $iamUserName"
    if ((aws iam list-attached-user-policies --user-name $iamUserName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todas as policies do usuário $iamUserName"
        aws iam list-attached-user-policies --user-name $iamUserName --query "AttachedPolicies[].PolicyName" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o ARN da policy $policyName"
        $policyArn = aws iam list-policies --query "Policies[?PolicyName=='$policyName'].[Arn]" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo a policy $policyName do usuário $iamUserName"
        aws iam detach-user-policy --user-name $iamUserName --policy-arn $policyArn

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todas as policies do usuário $iamUserName"
        aws iam list-attached-user-policies --user-name $iamUserName --query "AttachedPolicies[].PolicyName" --output text
    } else {Write-Output "Não existe a policy $policyName no usuário $iamUserName"}
} else {Write-Host "Código não executado"}