Write-Output "Importando o arquivo com as variáveis"
. "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\04-seguranca\automation\variaveis.ps1"

"-----//-----//-----//-----//-----//-----//-----"
Write-Output "SERVIÇO: AWS EC2"
"-----//-----//-----//-----//-----//-----//-----"
# Write-Output "KEY PAIR"
# if ((aws ec2 describe-key-pairs --query "KeyPairs[?KeyName=='$keyPairName']").Count -gt 1) {
#     Write-Output "Removendo o par de chaves criado de nome $keyPairName e os arquivos pem e ppk"
#     aws ec2 delete-key-pair --key-name $keyPairName

#     if (Test-Path "$keyPairPath\$keyPairName.pem" -PathType Leaf) {
#         Write-Host "Removendo o arquivo de par de chave $keyPairName.pem"
#         Remove-Item "$keyPairPath\$keyPairName.pem"
#     } else {
#         Write-Host "Não existe o arquivo de par de chave $keyPairName.pem"
#     }
#     if (Test-Path "$keyPairPath\$keyPairName.ppk" -PathType Leaf) {
#         Write-Host "Removendo o arquivo de par de chave $keyPairName.ppk"
#         Remove-Item "$keyPairPath\$keyPairName.ppk"
#     } else {
#         Write-Host "Não existe o arquivo de par de chave $keyPairName.ppk"
#     }
# } else {
#     Write-Output "Não existe o par de chaves de $keyPairName!"
# }

# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "AWS ELASTIC COMPUTE CLOUD (EC2)"
# if ((aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" --query "Reservations[].Instances[]").Count -gt 1) {

#     Write-Output "Extraindo o IP público da instância de nome de tag $tagNameInstance"
#     $ipEc2 = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
#     echo "$ipEc2"
#     $ipEc2 = $ipEc2.Replace(".", "-")
#     echo $ipEc2

#     Write-Output "Verificando se existe o diretório do projeto, se existir, alterando para ele e removendo a implantação da infraestrutura com o arquivo serverless"
#     # ssh -i "$keyPairPath\$keyPairName.pem" ubuntu@ec2-$ipEc2.compute-1.amazonaws.com "cd home/ubuntu/projectDioServerless && serverless remove"
#     # ssh -i "$keyPairPath\$keyPairName.pem" ubuntu@ec2-$ipEc2.compute-1.amazonaws.com '[ -d "/home/ubuntu/projectDioServerless" ] && cd "/home/ubuntu/projectDioServerless" && serverless remove'
#     ssh -i "$keyPairPath\$keyPairName.pem" ubuntu@ec2-$ipEc2.compute-1.amazonaws.com 'if [ -d "/home/ubuntu/projectDioServerless" ]; then cd "/home/ubuntu/projectDioServerless" && serverless remove; else echo "Pasta do projeto não encontrada."; fi'


#     Write-Output "Removendo a instância criada de nome de tag $tagNameInstance"
#     $instanceId1 = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" --query "Reservations[].Instances[].InstanceId" --output text
#     aws ec2 terminate-instances --instance-ids $instanceId1 --no-dry-run --no-cli-pager
# } else {
#     Write-Output "Não existe instâncias com o nome de tag $tagNameInstance!"
# }



# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "SERVIÇO: AWS API GATEWAY"
# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "API"
# if ((aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].name").Count -gt 1) {
#     Write-Output "Listando todas as APIs Gateway criadas"
#     aws apigateway get-rest-apis --query "items[].name" --output text

#     Write-Output "Extraindo o ID da API $apiGatewayName para criação de um recurso para ela"
#     $resourceId = aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].id" --output text

#     Write-Output "Removendo a API Gateway $apiGatewayName"
#     aws apigateway delete-rest-api --rest-api-id $resourceId

#     Write-Output "Listando todas as APIs Gateway criadas"
#     aws apigateway get-rest-apis --query "items[].name" --output text
# } else {
#     Write-Output "Não existe a API Gateway $apiGatewayName!"
# }




# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "SERVIÇO: AMAZON DYNAMODB"
# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "AMAZON DYNAMODB"
# if ((aws dynamodb describe-table --table-name $tableName --region $region).Count -gt 1) {
#     Write-Output "Listando todas as tabelas criadas"
#     aws dynamodb list-tables --region $region --query "TableNames" --output text

#     Write-Output "Removendo a tabela $tableName"
#     aws dynamodb delete-table --table-name $tableName --region $region

#     Write-Output "Listando todas as tabelas criadas"
#     aws dynamodb list-tables --region $region --query "TableNames" --output text
# } else {
#     Write-Output "Não existe a tabela $tableName!"
# }





"-----//-----//-----//-----//-----//-----//-----"
Write-Output "SERVIÇO: AWS Identity and Access Management (IAM)"
"-----//-----//-----//-----//-----//-----//-----"
Write-Output "POLICY - ROLE"
if ((aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName").Count -gt 1) {
    if ((aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName").Count -gt 1) {
        Write-Output "Listando todas as policies vinculada a role $roleName"
        aws iam list-attached-role-policies --role-name $roleName --query 'AttachedPolicies[].PolicyName' --output text
        
        Write-Output "Desvinculando a policy $policyName da role $roleName"
        $arnPolicy = aws iam list-policies --query "Policies[?PolicyName=='$policyName'].Arn" --output text
        aws iam detach-role-policy --role-name $roleName --policy-arn $arnPolicy
        
        Write-Output "Listando todas as policies vinculada a role $roleName"
        aws iam list-attached-role-policies --role-name $roleName --query 'AttachedPolicies[].PolicyName' --output text
    } else {
        Write-Output "Não existe uma policy $policyName vinculada a role $roleName!"
    }
} else {
    # Write-Output "Portanto a $policyName não foi atribuída!"
}




"-----//-----//-----//-----//-----//-----//-----"
Write-Output "POLICY"
if ((aws iam list-policies --query "Policies[?PolicyName=='$policyName'].PolicyName").Count -gt 1) {
    Write-Output "Listando todas as policies criadas"
    aws iam list-policies --query "Policies[?contains(Arn, ':$awsAccountId')].PolicyName" --output text

    Write-Output "Removendo a policy $policyName"
    $arnPolicy = aws iam list-policies --query "Policies[?PolicyName=='$policyName'].Arn" --output text
    aws iam delete-policy --policy-arn $arnPolicy

    Write-Output "Listando todas as polices criadas"
    aws iam list-policies --query "Policies[?contains(Arn, ':$awsAccountId')].PolicyName" --output text
} else {
    Write-Output "Não existe a policy $policyName!"
}


"-----//-----//-----//-----//-----//-----//-----"
Write-Output "ROLE"
if ((aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName").Count -gt 1) {
    Write-Output "Listando todas as roles criadas"
    aws iam list-roles --query 'Roles[].RoleName' --output text

    Write-Output "Removendo a role $roleName"
    aws iam delete-role --role-name $roleName

    Write-Output "Listando todas as roles criadas"
    aws iam list-roles --query 'Roles[].RoleName' --output text
} else {
    Write-Output "Não existe a role $roleName!"
}




# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "SERVIÇO: AWS LAMBDA"
# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "FUNCTION"
# if ((aws lambda list-functions --query "Functions[?FunctionName=='$lambdaFunctionName'].FunctionName").Count -gt 1) {
#     Write-Output "Listando todas as funções Lambdas criadas"
#     aws lambda list-functions --query "Functions[].FunctionName" --output text

#     Write-Output "Removendo a função Lambda $lambdaFunctionName"
#     aws lambda delete-function --function-name $lambdaFunctionName --region $region

#     Write-Output "Listando todas as funções Lambdas criadas"
#     aws lambda list-functions --query "Functions[].FunctionName" --output text
# } else {
#     Write-Output "Não existe a função Lambda $lambdaFunctionName!"
# }



