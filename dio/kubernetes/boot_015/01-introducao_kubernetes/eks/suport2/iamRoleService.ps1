#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS IAM"
Write-Output "IAM ROLE SERVICE CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$roleName = "eksEC2Role"
$serviceName = "ec2.amazonaws.com"
# $pathTrustPolicyDocument = "G:\Meu Drive\4_PROJ\scripts\scripts_model\.default\aws\iamTrustPolicy.json"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe a role de nome $roleName"
    if ((aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe uma role de nome $roleName"
        aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todas as roles criadas"
        aws iam list-roles --query 'Roles[].RoleName' --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando a role de nome $roleName"
        aws iam create-role --role-name $roleName --assume-role-policy-document "{
            `"Version`": `"2012-10-17`",
            `"Statement`": [
              {
                `"Effect`": `"Allow`",
                `"Principal`": {`"Service`": `"$serviceName`"},
                `"Action`": `"sts:AssumeRole`"
              }
            ]
          }" --no-cli-pager
    
        # Write-Output "-----//-----//-----//-----//-----//-----//-----"
        # Write-Output "Criando a role de nome $roleName com um arquivo JSON"
        # aws iam create-role --role-name $roleName --assume-role-policy-document file://$pathTrustPolicyDocument
        
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando a role de nome $roleName"
        aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS IAM"
Write-Output "IAM ROLE SERVICE EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$roleName = "eksEC2Role"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe a role de nome $roleName"
    if ((aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todas as roles criadas"
        aws iam list-roles --query 'Roles[].RoleName' --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Obtendo a lista de ARNs de policies anexadas à role de nome $roleName"
        $attachedPolicies = aws iam list-attached-role-policies --role-name $roleName --query 'AttachedPolicies[*].PolicyArn' --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se a lista de ARNs de policies anexadas à role de nome $roleName está vazia"
        if ($null -ne $attachedPolicies -and $attachedPolicies -ne "") {
          Write-Output "-----//-----//-----//-----//-----//-----//-----"
          Write-Output "Iterando na lista de policies"
          foreach ($policyArn in $attachedPolicies.Split()) {
              if ($policyArn -ne "") {
                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Extraindo o nome da policy vinculada a role"
                $policyName = aws iam list-policies --query "Policies[?Arn=='$policyArn'].PolicyName" --output text

                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Removendo a policy $policyName da role de nome $roleName"
                aws iam detach-role-policy --role-name $roleName --policy-arn $policyArn
              }
          }
        } else {Write-Output "Não existe policies anexadas à role de nome $roleName"}

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo a role de nome $roleName"
        aws iam delete-role --role-name $roleName

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todas as roles criadas"
        aws iam list-roles --query 'Roles[].RoleName' --output text
    } else {Write-Output "Não existe a role de nome $roleName"}
} else {Write-Host "Código não executado"}