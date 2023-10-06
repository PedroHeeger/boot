Write-Output "Importando o arquivo com as variáveis"
. "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\04-seguranca\automation\variaveis.ps1"

"-----//-----//-----//-----//-----//-----//-----"
Write-Output "SERVIÇO: AWS Identity and Access Management (IAM)"
"-----//-----//-----//-----//-----//-----//-----"
Write-Output "POLICY - ROLE"
Write-Output "Verificando se existe a role $roleName..."
if ((aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName").Count -gt 1) {
    Write-Output "Verificando se policy $policyName está atribuída a role $roleName..."
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
    Write-Output "Não existe a role $roleName!"
}


"-----//-----//-----//-----//-----//-----//-----"
Write-Output "POLICY"
Write-Output "Verificando se existe a policy $policyName..."
if ((aws iam list-policies --query "Policies[?PolicyName=='$policyName'].PolicyName").Count -gt 1) {
    Write-Output "Listando todas as policies criadas"
    aws iam list-policies --query "Policies[?contains(Arn, ':$awsAccountId')].PolicyName" --output text

    Write-Output "Removendo a policy $policyName"
    $arnPolicy = aws iam list-policies --query "Policies[?PolicyName=='$policyName'].Arn" --output text
    # $versions = aws iam list-policy-versions --policy-arn $arnPolicy --query "Versions[?IsDefaultVersion=='false'].VersionId" --output text

    # foreach ($version in $versions.Split()) {
    #     aws iam delete-policy-version --policy-arn $arnPolicy --version-id $version
    # }
    aws iam delete-policy --policy-arn $arnPolicy

    Write-Output "Listando todas as polices criadas"
    aws iam list-policies --query "Policies[?contains(Arn, ':$awsAccountId')].PolicyName" --output text
} else {
    Write-Output "Não existe a policy $policyName!"
}


"-----//-----//-----//-----//-----//-----//-----"
Write-Output "ROLE"
Write-Output "Verificando se existe a role $roleName..."
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



"-----//-----//-----//-----//-----//-----//-----"
Write-Output "SERVIÇO: AWS LAMBDA"
"-----//-----//-----//-----//-----//-----//-----"
Write-Output "RESOURCE-BASED POLICY"
Write-Output "Verificando se existe a função lambda $lambdaFunctionName..."
if ((aws lambda list-functions --query "Functions[?FunctionName=='$lambdaFunctionName'].FunctionName").Count -gt 1) {
    Write-Output "Verificando se existe uma política baseada em recursos (Ignorando erro)..."
    if ((aws lambda get-policy --function-name $lambdaFunctionName 2>&1) -match "ResourceNotFoundException"){
        Write-Output "Não existe uma política baseada em recursos da função lambda $lambdaFunctionName!"
    } else {
        Write-Output "Verificando se existe uma política baseada em recursos..."
        if ((aws lambda get-policy --function-name $lambdaFunctionName).Count -gt 1) {
            Write-Output "Listando todas as políticas baseadas em recursos da função lambda $lambdaFunctionName"
            aws lambda get-policy --function-name $lambdaFunctionName --query "Policy" --output json | ConvertFrom-Json | jq -r '.Statement[].Sid' 

            Write-Output "Removendo a política baseada em recursos da função lambda $lambdaFunctionName para liberar a API Gateway"
            $statementId = aws lambda get-policy --function-name $lambdaFunctionName --query "Policy" --output json | ConvertFrom-Json | jq -r '.Statement[].Sid' 
            aws lambda remove-permission --function-name $lambdaFunctionName --statement-id $statementId

            # Write-Output "Listando todas as políticas baseadas em recursos da função lambda $lambdaFunctionName"
            # aws lambda get-policy --function-name $lambdaFunctionName --query "Policy" --output json | ConvertFrom-Json | jq -r '.Statement[].Sid' 
        } else {
            Write-Output "Não existe uma política baseada em recursos da função lambda $lambdaFunctionName!"
        }
    }
} else {
    Write-Output "Não existe a função lambda $lambdaFunctionName!"
}


"-----//-----//-----//-----//-----//-----//-----"
Write-Output "FUNCTION"
Write-Output "Verificando se existe a função lambda $lambdaFunctionName..."
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
Write-Output "Verificando se existe a API Gateway $apiGatewayName..."
if ((aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].name").Count -gt 1) {

    "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "RESOURCE"
    Write-Output "Verificando se existe o recurso $resourceApiName..."
    # Write-Output "Extraindo o ID da API $apiGatewayName para criação de um recurso para ela"
    $apiId = aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].id" --output text 
    if ((aws apigateway get-resources --rest-api-id $apiId --query "items[?pathPart=='$resourceApiName'].id").Count -gt 1) {

        "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "METHOD POST"
        Write-Output "Verificando se existe o método POST para o recurso..."
        # Write-Output "Extraindo o ID do recurso $resourceApiName para criação de um método para ela"
        $resourceId = aws apigateway get-resources --rest-api-id $apiId --query "items[?pathPart=='$resourceApiName'].id" --output text
        if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST).Count -gt 1) {
            
            "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "DEPLOYMENT"
            Write-Output "Verificando se existe o estágio de deployment $stageName (Ignorando erro)..."
            if ((aws apigateway get-stage --rest-api-id $apiId --stage-name $stageName --query "stageName=='$stageName'" 2>&1) -match "NotFoundException"){
                Write-Output "Não existe o deployment $stageName na API Gateway $apiGatewayName!"
            } else {
                Write-Output "Verificando se existe o estágio de deployment $stageName..."
                if ((aws apigateway get-stage --rest-api-id $apiId --stage-name $stageName --query "stageName=='$stageName'") -eq 'true') {
                    Write-Output "Listando todos os deployments da API $apiGatewayName"
                    aws apigateway get-stage --rest-api-id $apiId --stage-name $stageName --query "stageName" --output text
            
                    Write-Output "Removendo o estágio de deployment $stageName da API Gateway $apiGatewayName"
                    $deploymentId = aws apigateway get-stage --rest-api-id $apiId --stage-name $stageName --query "deploymentId" --output text
                    aws apigateway delete-stage --rest-api-id $apiId --stage-name $stageName
                    # aws apigateway delete-deployment --rest-api-id $apiId --deployment-id $deploymentId
            
                    # Write-Output "Listando todos os deployments da API $apiGatewayName"
                    # aws apigateway get-stage --rest-api-id $apiId --stage-name $stageName --query "stageName" --output text
                } else {
                    Write-Output "Não existe o deployment $stageName na API Gateway $apiGatewayName!"
                }
            }

            "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "INTEGRATION RESPONSE"
            Write-Output "Verificando se existe a integração de resposta para o método POST do recurso $resourceApiName (Ignorando erro)..."
            if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration.integrationResponses" 2>&1) -match "NotFoundException"){
                Write-Output "Não existe uma integração de resposta para o método POST do recurso $resourceApiName!"
            } else {
                Write-Output "Verificando se existe a integração de resposta para o método POST do recurso $resourceApiName..."
                if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration.integrationResponses").Count -gt 1) {
                    Write-Output "Exibindo a integração de resposta para o método POST do recurso $resourceApiName"
                    aws apigateway get-method-response --rest-api-id $apiId --resource-id $resourceId --http-method POST --status-code 200

                    Write-Output "Removendo a integração de resposta do método POST do recurso $resourceApiName"
                    aws apigateway delete-method-response --rest-api-id $apiId --resource-id $resourceId --http-method POST --status-code 200

                    # Write-Output "Exibindo a integração de resposta para o método POST do recurso $resourceApiName"
                    # aws apigateway get-method-response --rest-api-id $apiId --resource-id $resourceId --http-method POST --status-code 200
                } else {
                    Write-Output "Não existe uma integração de resposta para o método POST do recurso $resourceApiName!"
                }
            }

            "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "INTEGRATION REQUEST"
            Write-Output "Verificando se existe a integração de solicitação para o método POST do recurso $resourceApiName..."
            if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration.type=='$methodIntegrationType'") -eq 'true') {
                Write-Output "Exibindo a integração de solicitação do tipo $methodIntegrationType para o método POST do recurso $resourceApiName"
                aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration" --no-cli-pager

                Write-Output "Removendo a integração de solicitação do método POST do recurso $resourceApiName com o serviço Lambda"
                aws apigateway delete-integration --rest-api-id $apiId --resource-id $resourceId --http-method POST --no-cli-pager

                Write-Output "Exibindo a integração de solicitação do tipo $methodIntegrationType para o método POST do recurso $resourceApiName"
                aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration" --no-cli-pager
            } else {
                Write-Output "Não existe a integração de solicitação para o método POST do recurso $resourceApiName!"
            }

        } else {
            Write-Output "Não existe a integração de solicitação para o método POST do recurso $resourceApiName!"
        } 
    } else {   
        Write-Output "Não existe o recurso $resourceApiName na API Gateway $apiGatewayName!"
    }
} else {
    Write-Output "Não existe a API Gateway $apiGatewayName!"
}


"-----//-----//-----//-----//-----//-----//-----"
Write-Output "API GATEWAY"
Write-Output "Verificando se existe a API Gateway $apiGatewayName..."
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
Write-Output "Verificando se existe a tabela $tableName (Ignorando erro)..."
if ((aws dynamodb describe-table --table-name $tableName --region $region 2>&1) -match "ResourceNotFoundException"){
    Write-Output "Não existe a tabela $tableName!"
} else {
    Write-Output "Verificando se existe a tabela $tableName..."
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
}




"-----//-----//-----//-----//-----//-----//-----"
Write-Output "SERVIÇO: AMAZON COGNITO"
"-----//-----//-----//-----//-----//-----//-----"
Write-Output "USER-POOL"
Write-Output "Verificando se existe a User-Pool $userPoolName..."
if ((aws cognito-idp list-user-pools --max-results 10 --query "UserPools[?Name=='$userPoolName'].Name").Count -gt 1) {
    "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "DOMAIN"
    Write-Output "Verificando se existe o domínio $domainUserPool para User-Pool..."
    $userPoolId = aws cognito-idp list-user-pools --max-results 10 --query "UserPools[?Name=='$userPoolName'].Id" --output text
    if ((aws cognito-idp describe-user-pool --user-pool-id $userPoolId --query "UserPool.Domain=='$domainUserPool'") -eq "true") {
        Write-Output "Listando todos os domínios da User Pool $userPoolName"
        aws cognito-idp describe-user-pool --user-pool-id $userPoolId --query "UserPool.Domain" --output text

        Write-Output "Removendo o domínio $domainUserPool da User Pool $userPoolName"
        aws cognito-idp delete-user-pool-domain --user-pool-id $userPoolId --domain $domainUserPool

        Write-Output "Listando todos os domínios da User Pool $userPoolName"
        aws cognito-idp describe-user-pool --user-pool-id $userPoolId --query "UserPool.Domain" --output text
    } else {
        Write-Output "Não existe o domínio $domainUserPool da User Pool $userPoolName"
    }


    "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "CLIENT"
    Write-Output "Verificando se existe o Client $appClientName..."
    $userPoolId = aws cognito-idp list-user-pools --max-results 10 --query "UserPools[?Name=='$userPoolName'].Id" --output text
    if ((aws cognito-idp list-user-pool-clients --user-pool-id $userPoolId --query "UserPoolClients[?ClientName=='$appClientName'].ClientName").Count -gt 1) {
        Write-Output "Listando todos os Clients da User Pool $userPoolName"
        aws cognito-idp list-user-pool-clients --user-pool-id $userPoolId --query "UserPoolClients[].ClientName" --output text

        Write-Output "Removendo o Client $appClientName da User Pool $userPoolName"
        $clientId = aws cognito-idp list-user-pool-clients --user-pool-id $userPoolId --query "UserPoolClients[?ClientName=='$appClientName'].ClientId" --output text
        aws cognito-idp delete-user-pool-client --user-pool-id $userPoolId --client-id $clientId

        Write-Output "Listando todos os Clients da User Pool $userPoolName"
        aws cognito-idp list-user-pool-clients --user-pool-id $userPoolId --query "UserPoolClients[].ClientName" --output text
    } else {
        Write-Output "Não existe o Client $appClientName da User Pool $userPoolName!"
    }
} else {
    Write-Output "Não existe a User Pool $userPoolName!"
}

"-----//-----//-----//-----//-----//-----//-----"
Write-Output "USER-POOL"
Write-Output "Verificando se existe a User-Pool $userPoolName..."
if ((aws cognito-idp list-user-pools --max-results 10 --query "UserPools[?Name=='$userPoolName'].Name").Count -gt 1) {
    Write-Output "Listando pelo menos 20 User Pools"
    aws cognito-idp list-user-pools --max-results 10 --query "UserPools[].Name" --output text

    $userPoolId = aws cognito-idp list-user-pools --max-results 10 --query "UserPools[?Name=='$userPoolName'].Id" --output text
    Write-Output "Verificando se a proteção de exclusão da User-Pool $userPoolName está ativa..."
    if ((aws cognito-idp describe-user-pool --user-pool-id $userPoolId --query "UserPool.DeletionProtection=='ACTIVE'") -eq "true") {
        Write-Output "Desativando a proteção de exclusão da User Pool $userPoolName"
        # aws cognito-idp update-user-pool --user-pool-id $userPoolId --admin-create-user-config AllowAdminCreateUserOnly=false
        aws cognito-idp update-user-pool --user-pool-id $userPoolId --deletion-protection "INACTIVE" --auto-verified-attributes "email"
    } else {}

    Write-Output "Removendo a User Pool $userPoolName"
    aws cognito-idp delete-user-pool --user-pool-id $userPoolId

    Write-Output "Listando pelo menos 20 User Pools"
    aws cognito-idp list-user-pools --max-results 10 --query "UserPools[].Name" --output text
} else {
    Write-Output "Não existe a User Pool $userPoolName!"
}
