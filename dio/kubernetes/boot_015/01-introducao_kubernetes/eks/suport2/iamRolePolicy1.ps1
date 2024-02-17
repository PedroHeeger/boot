#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS IAM"
Write-Output "IAM ROLE ADD POLICY"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$roleName = "eksEC2Role"
$policyName1 = "AmazonEKS_CNI_Policy"
$policyArn1 = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe a policy $policyName1 anexada a role de nome $roleName"
    if ((aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[?PolicyName=='$policyName1'].PolicyName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe a policy $policyName1 anexada a role de nome $roleName"
        aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[?PolicyName=='$policyName1'].PolicyName" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todas as polices anexadas a role de nome $roleName"
        aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[].PolicyName" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o ARN da policy $policyName1"
        $policyArn1 = aws iam list-policies --query "Policies[?PolicyName=='$policyName1'].[Arn]" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Vinculando a polciy $policyName1 a role de nome $roleName"
        aws iam attach-role-policy --role-name $roleName --policy-arn $policyArn1

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando a policy $policyName1 anexada a role de nome $roleName"
        aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[?PolicyName=='$policyName1'].PolicyName" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS IAM"
Write-Output "IAM ROLE REMOVE POLICY"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$roleName = "eksEC2Role"
$policyName1 = "AmazonEKS_CNI_Policy"
$policyArn1 = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe a policy $policyName1 anexada a role de nome $roleName"
    if ((aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[?PolicyName=='$policyName1'].PolicyName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todas as polices anexadas a role de nome $roleName"
        aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[].PolicyName" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o ARN da policy $policyName1"
        $policyArn1 = aws iam list-policies --query "Policies[?PolicyName=='$policyName1'].[Arn]" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo a policy $policyName1 da role de nome $roleName"
        aws iam detach-role-policy --role-name $roleName --policy-arn $policyArn1

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todas as polices anexadas a role de nome $roleName"
        aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[].PolicyName" --output text
    } else {Write-Output "Não existe a policy $policyName1 anexada a role de nome $roleName"}
} else {Write-Host "Código não executado"}