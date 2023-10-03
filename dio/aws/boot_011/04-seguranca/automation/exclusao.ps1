Write-Output "Importando o arquivo com as variáveis"
. "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\04-seguranca\automation\variaveis.ps1"

# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "SERVIÇO: AWS Identity and Access Management (IAM)"
# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "POLICY - ROLE"
# if ((aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName").Count -gt 1) {
#     if ((aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName").Count -gt 1) {
#         Write-Output "Listando todas as policies vinculada a role $roleName"
#         aws iam list-attached-role-policies --role-name $roleName --query 'AttachedPolicies[].PolicyName' --output text
        
#         Write-Output "Desvinculando a policy $policyName da role $roleName"
#         $arnPolicy = aws iam list-policies --query "Policies[?PolicyName=='$policyName'].Arn" --output text
#         aws iam detach-role-policy --role-name $roleName --policy-arn $arnPolicy
        
#         Write-Output "Listando todas as policies vinculada a role $roleName"
#         aws iam list-attached-role-policies --role-name $roleName --query 'AttachedPolicies[].PolicyName' --output text
#     } else {
#         Write-Output "Não existe uma policy $policyName vinculada a role $roleName!"
#     }
# } else {
#     Write-Output "Portanto a $policyName não foi atribuída!"
# }


# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "POLICY"
# if ((aws iam list-policies --query "Policies[?PolicyName=='$policyName'].PolicyName").Count -gt 1) {
#     Write-Output "Listando todas as policies criadas"
#     aws iam list-policies --query "Policies[?contains(Arn, ':$awsAccountId')].PolicyName" --output text

#     Write-Output "Removendo a policy $policyName"
#     $arnPolicy = aws iam list-policies --query "Policies[?PolicyName=='$policyName'].Arn" --output text
#     # $versions = aws iam list-policy-versions --policy-arn $arnPolicy --query "Versions[?IsDefaultVersion=='false'].VersionId" --output text

#     # foreach ($version in $versions.Split()) {
#     #     aws iam delete-policy-version --policy-arn $arnPolicy --version-id $version
#     # }

#     aws iam delete-policy-version --policy-arn $arnPolicy

#     Write-Output "Listando todas as polices criadas"
#     aws iam list-policies --query "Policies[?contains(Arn, ':$awsAccountId')].PolicyName" --output text
# } else {
#     Write-Output "Não existe a policy $policyName!"
# }


# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "ROLE"
# if ((aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName").Count -gt 1) {
#     Write-Output "Listando todas as roles criadas"
#     aws iam list-roles --query 'Roles[].RoleName' --output text

#     Write-Output "Removendo a role $roleName"
#     aws iam delete-role --role-name $roleName

#     Write-Output "Listando todas as roles criadas"
#     aws iam list-roles --query 'Roles[].RoleName' --output text
# } else {
#     Write-Output "Não existe a role $roleName!"
# }



"-----//-----//-----//-----//-----//-----//-----"
Write-Output "SERVIÇO: AWS LAMBDA"
"-----//-----//-----//-----//-----//-----//-----"
Write-Output "RESOURCE-BASED POLICY"
if ((aws lambda list-functions --query "Functions[?FunctionName=='$lambdaFunctionName'].FunctionName").Count -gt 1) {
    if ((aws lambda get-policy --function-name $lambdaFunctionName).Count -gt 1) {
        Write-Output "Listando todas as políticas baseadas em recursos da função lambda $lambdaFunctionName"
        aws lambda get-policy --function-name $lambdaFunctionName

        Write-Output "Removendo a política baseada em recursos da função lambda $lambdaFunctionName para liberar a API Gateway"
        $statementId = aws lambda get-policy --function-name $lambdaFunctionName --query "Policy" --output json | ConvertFrom-Json | jq -r '.Statement[].Sid' 
        aws lambda remove-permission --function-name $lambdaFunctionName --statement-id $statementId

        Write-Output "Listando todas as políticas baseadas em recursos da função lambda $lambdaFunctionName"
        aws lambda get-policy --function-name $lambdaFunctionName
    } else {
        Write-Output "Não existe uma política baseada em recursos da função lambda $lambdaFunctionName!"
    }
} else {
    Write-Output "Não existe a função lambda $lambdaFunctionName!"
}


"-----//-----//-----//-----//-----//-----//-----"
Write-Output "FUNCTION"
if ((aws lambda list-functions --query "Functions[?FunctionName=='$lambdaFunctionName'].FunctionName").Count -gt 1) {
    Write-Output "Listando todas as funções lambdas criadas"
    aws lambda list-functions --query "Functions[].FunctionName" --output text

    Write-Output "Removendo a função lambda $lambdaFunctionName"
    aws lambda delete-function --function-name $lambdaFunctionName --region $region

    Write-Output "Listando todas as funções lambdas criadas"
    aws lambda list-functions --query "Functions[].FunctionName" --output text
} else {
    Write-Output "Não existe a função lambda $lambdaFunctionName!"
}



"-----//-----//-----//-----//-----//-----//-----"
Write-Output "SERVIÇO: AWS API GATEWAY"
"-----//-----//-----//-----//-----//-----//-----"
Write-Output "API GATEWAY"
if ((aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].name").Count -gt 1) {

    # "-----//-----//-----//-----//-----//-----//-----"
    # Write-Output "API RESOURCE"
    # Write-Output "Extraindo o ID da API $apiGatewayName para criação de um recurso para ela"
    $apiId = aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].id" --output text 
    if ((aws apigateway get-resources --rest-api-id $apiId --query "items[?pathPart=='$resourceApiName'].id").Count -gt 1) {

        # "-----//-----//-----//-----//-----//-----//-----"
        # Write-Output "API RESOURCE METHOD POST"
        # Write-Output "Extraindo o ID do recurso $resourceApiName para criação de um método para ela"
        $resourceId = aws apigateway get-resources --rest-api-id $apiId --query "items[?pathPart=='$resourceApiName'].id" --output text
        if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST).Count -gt 1) {
            
            try {
                "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "API DEPLOYMENT"
                if ((aws apigateway get-stage --rest-api-id $apiId --stage-name development --query "stageName=='development'") -eq 'true') {
                    Write-Output "Listando todos os deployments da API $apiGatewayName"
                    aws apigateway get-stage --rest-api-id $apiId --stage-name $stageName --query "stageName" --output text
            
                    Write-Output "Removendo o deployment $stageName da API Gateway $apiGatewayName"
                    $deploymentId = aws apigateway get-stage --rest-api-id $apiId --stage-name development --query "deploymentId" --output text
                    aws apigateway delete-stage --rest-api-id $apiId --stage-name $stageName
                    # aws apigateway delete-deployment --rest-api-id $apiId --deployment-id $deploymentId
            
                    Write-Output "Listando todos os deployments da API $apiGatewayName"
                    aws apigateway get-stage --rest-api-id $apiId --stage-name $stageName --query "stageName" --output text
                } else {
                    Write-Output "Não existe o deployment $stageName na API Gateway $apiGatewayName!"
                }
            } catch {if ($_.Exception.Message -like "*NotFoundException*") {} else {Write-Output "Erro: $_"}}

            "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "API RESOURCE METHOD INTEGRATION (RESPONSE)"
            if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration.integrationResponses").Count -gt 1) {
                Write-Output "Exibindo a configuração de resposta para o método POST do recurso $resourceApiName"
                aws apigateway get-method-response --rest-api-id $apiId --resource-id $resourceId --http-method POST --status-code 200

                Write-Output "Removendo a configuração de resposta do método POST"
                aws apigateway delete-method-response --rest-api-id $apiId --resource-id $resourceId --http-method POST --status-code 200

                Write-Output "Exibindo a configuração de resposta para o método POST do recurso $resourceApiName"
                aws apigateway get-method-response --rest-api-id $apiId --resource-id $resourceId --http-method POST --status-code 200
            } else {
                Write-Output "Não existe uma configuração de resposta para o método POST do recurso $resourceApiName!"
            }

            "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "API RESOURCE METHOD INTEGRATION (REQUEST)"
            if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration.type=='$methodIntegrationType'") -eq 'true') {
                Write-Output "Exibindo a integração do tipo $methodIntegrationType para o método POST do recurso $resourceApiName"
                aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration"

                Write-Output "Removendo a integração do método POST do recurso $resourceApiName com o serviço Lambda"
                aws apigateway delete-integration --rest-api-id $apiId --resource-id $resourceId --http-method POST --no-cli-pager

                Write-Output "Exibindo a integração do tipo $methodIntegrationType para o método POST do recurso $resourceApiName"
                aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration"
            } else {
                Write-Output "Não existe uma configuração de integração para o método POST do recurso $resourceApiName!"
            }

        } else {
            Write-Output "Não existe o método POST do recurso $resourceApiName na API $apiGatewayName"
        } 
    } else {   
        Write-Output "Não existe o recurso $resourceApiName na API Gateway $apiGatewayName"
    }
} else {
    Write-Output "Não existe a API Gateway $apiGatewayName!"
}


"-----//-----//-----//-----//-----//-----//-----"
Write-Output "API"
if ((aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].name").Count -gt 1) {
    Write-Output "Listando todas as APIs Gateway criadas"
    aws apigateway get-rest-apis --query "items[].name" --output text

    Write-Output "Extraindo o ID da API $apiGatewayName para criação de um recurso para ela"
    $resourceId = aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].id" --output text

    Write-Output "Removendo a API Gateway $apiGatewayName"
    aws apigateway delete-rest-api --rest-api-id $resourceId

    Write-Output "Listando todas as APIs Gateway criadas"
    aws apigateway get-rest-apis --query "items[].name" --output text
} else {
    Write-Output "Não existe a API Gateway $apiGatewayName!"
}




"-----//-----//-----//-----//-----//-----//-----"
Write-Output "SERVIÇO: AMAZON DYNAMODB"
"-----//-----//-----//-----//-----//-----//-----"
Write-Output "AMAZON DYNAMODB"
if ((aws dynamodb describe-table --table-name $tableName --region $region).Count -gt 1) {
    Write-Output "Listando todas as tabelas criadas"
    aws dynamodb list-tables --region $region --query "TableNames" --output text

    Write-Output "Removendo a tabela $tableName"
    aws dynamodb delete-table --table-name $tableName --region $region --no-cli-pager

    Write-Output "Listando todas as tabelas criadas"
    aws dynamodb list-tables --region $region --query "TableNames" --output text
} else {
    Write-Output "Não existe a tabela $tableName!"
}






