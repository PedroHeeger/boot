Write-Output "Importando o arquivo com as variáveis"
. "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\04-seguranca\automation\variaveis.ps1"

"-----//-----//-----//-----//-----//-----//-----"
Write-Output "SERVIÇO: AWS API GATEWAY"
"-----//-----//-----//-----//-----//-----//-----"
Write-Output "API GATEWAY"
Write-Output "Verificando se existe a API Gateway $apiGatewayName..."
if ((aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].name").Count -gt 1) {
    Write-Output "A API Gateway $apiGatewayName já foi criada!"
    aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].name" --output text
} else {
    Write-Output "Listando todas as APIs Gateway criadas"
    aws apigateway get-rest-apis --query "items[].name" --output text

    Write-Output "Criando a API Gateway $apiGatewayName"
    aws apigateway create-rest-api --name "$apiGatewayName" --description "API criada no Bootcamp 011 de AWS" --endpoint-configuration "types=REGIONAL" --region $region --no-cli-pager

    Write-Output "Listando apenas a API Gateway $apiGatewayName"
    aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].name" --output text
}

"-----//-----//-----//-----//-----//-----//-----"
Write-Output "RESOURCE"
Write-Output "Verificando se existe a API Gateway $apiGatewayName..."
if ((aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].name").Count -gt 1) {

    Write-Output "Verificando se existe o recurso $resourceApiName..."
    # Write-Output "Extraindo o ID da API $apiGatewayName para criação de um recurso para ela"
    $resourceId = aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].id" --output text
    if ((aws apigateway get-resources --rest-api-id $resourceId --query "items[?pathPart=='$resourceApiName'].id").Count -gt 1) {
        Write-Output "A API Gateway $apiGatewayName já possui o recurso $resourceApiName!"
        aws apigateway get-resources --rest-api-id $resourceId --query "items[?pathPart=='$resourceApiName'].pathPart" --output text
    } else {
        Write-Output "Listando todos os recursos da API Gateway $apiGatewayName"
        aws apigateway get-resources --rest-api-id $resourceId --query "items[].pathPart" --output text
    
        Write-Output "Extraindo o ID do recursos raíz (/) da API Gateway $apiGatewayName"
        $apiId = aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].id" --output text 
        $parentId = aws apigateway get-resources --rest-api-id $apiId --query "items[?path=='/'].id" --output text
        Write-Output "$parentId"      

        Write-Output "Criando o recurso $resourceApiName da API Gateway $apiGatewayName"
        aws apigateway create-resource --rest-api-id $resourceId --parent-id $parentId --path-part $resourceApiName
    
        Write-Output "Listando apenas o recurso $resourceApiName da API Gateway $apiGatewayName"
        aws apigateway get-resources --rest-api-id $resourceId --query "items[?pathPart=='$resourceApiName'].pathPart" --output text
    }
} else {
    Write-Output "Não existe a API Gateway $apiGatewayName!"
}




"-----//-----//-----//-----//-----//-----//-----"
Write-Output "SERVIÇO: AMAZON DYNAMODB"
"-----//-----//-----//-----//-----//-----//-----"
Write-Output "AMAZON DYNAMODB"
Write-Output "Verificando se existe a tabela $tableName (Ignorando erro)..."
if ((aws dynamodb describe-table --table-name $tableName --region $region 2>&1) -match "ResourceNotFoundException"){
    Write-Output "A tabela $tableName não foi encontrada!"

    Write-Output "Listando todas as tabelas criadas"
    aws dynamodb list-tables --region $region --query "TableNames" --output text

    Write-Output "Criando a tabela $tableName"
    aws dynamodb create-table --table-name $tableName --attribute-definitions AttributeName=id,AttributeType=S --key-schema AttributeName=id,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 --region $region --no-cli-pager

    Write-Output "Listando apenas a tabela $tableName"
    aws dynamodb describe-table --table-name $tableName --region $region --query "Table.TableName" --output text
} else {
    Write-Output "Verificando se existe a tabela $tableName..."
    if ((aws dynamodb describe-table --table-name $tableName --region $region).Count -gt 1) {
        Write-Output "A tabela $tableName já foi criada!"
        aws dynamodb describe-table --table-name $tableName --region $region --query "Table.TableName" --output text
    } else {
        Write-Output "Listando todas as tabelas criadas"
        aws dynamodb list-tables --region $region --query "TableNames" --output text

        Write-Output "Criando a tabela $tableName"
        aws dynamodb create-table --table-name $tableName --attribute-definitions AttributeName=id,AttributeType=S --key-schema AttributeName=id,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 --region $region --no-cli-pager

        Write-Output "Listando apenas a tabela $tableName"
        aws dynamodb describe-table --table-name $tableName --region $region --query "Table.TableName" --output text
    }
}




"-----//-----//-----//-----//-----//-----//-----"
Write-Output "SERVIÇO: AWS Identity and Access Management (IAM)"
"-----//-----//-----//-----//-----//-----//-----"
Write-Output "POLICY"
Write-Output "Verificando se existe a policy $policyName..."
if ((aws iam list-policies --query "Policies[?PolicyName=='$policyName'].PolicyName").Count -gt 1) {
    Write-Output "A policy $policyName já foi criada!"
    aws iam list-policies --query "Policies[?PolicyName=='$policyName'].PolicyName" --output text
} else {
    Write-Output "Listando todas as policies criadas"
    aws iam list-policies --query "Policies[?contains(Arn, ':$awsAccountId')].PolicyName" --output text

    Write-Output "Criando a policy $policyName"
    $jsonString = '{
        "Version": "2012-10-17",
        "Statement": [
          {
            "Effect": "Allow",
            "Action": "dynamodb:PutItem",
            "Resource": "arn:aws:dynamodb:' + $region + ':' + $awsAccountId + ':table/' + $tableName + '"
          }
        ]
      }'
    # echo $jsonString

    aws iam create-policy --policy-name $policyName --policy-document $jsonString --no-cli-pager

    Write-Output "Listando apenas a policy $policyName"
    aws iam list-policies --query "Policies[?PolicyName=='$policyName'].PolicyName" --output text
}


"-----//-----//-----//-----//-----//-----//-----"
Write-Output "ROLE"
Write-Output "Verificando se existe a role $roleName..."
if ((aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName").Count -gt 1) {
    Write-Output "A role $roleName já foi criada!"
    aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName" --output text
} else {
    Write-Output "Listando todas as roles criadas"
    aws iam list-roles --query 'Roles[].RoleName' --output text

    Write-Output "Criando a role $roleName para o serviço do Lambda"
    aws iam create-role --role-name $roleName --no-cli-pager --assume-role-policy-document '{
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Principal": {
            "Service": "lambda.amazonaws.com"
          },
          "Action": "sts:AssumeRole"
        }
      ]
    }'

    Write-Output "Listando apenas a role $roleName"
    aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName" --output text
}


"-----//-----//-----//-----//-----//-----//-----"
Write-Output "POLICY - ROLE"
Write-Output "Verificando se existe a role $roleName..."
if ((aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName").Count -gt 1) {
    Write-Output "Verificando se policy $policyName está atribuída a role $roleName..."
    if ((aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName").Count -gt 1) {
        Write-Output "A role $roleName já possui a policy $policyName atribuída!"
        aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName" --output text
    } else {
        Write-Output "Listando todas as policies vinculada a role $roleName"
        aws iam list-attached-role-policies --role-name $roleName --query 'AttachedPolicies[].PolicyName' --output text
        
        Write-Output "Atribuindo a policy $policyName a role $roleName"
        $arnPolicy = aws iam list-policies --query "Policies[?PolicyName=='$policyName'].Arn" --output text
        aws iam attach-role-policy --role-name $roleName --policy-arn $arnPolicy
        
        Write-Output "Listando apenas a policy $policyName vinculada a role $roleName"
        aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName" --output text
    }
} else {
    Write-Output "A role $roleName não foi criada. Portanto a $policyName não pode ser atribuída!"
}




"-----//-----//-----//-----//-----//-----//-----"
Write-Output "SERVIÇO: AWS LAMBDA"
"-----//-----//-----//-----//-----//-----//-----"
Write-Output "FUNCTION"
Write-Output "Verificando se existe a função lambda $lambdaFunctionName..."
if ((aws lambda list-functions --query "Functions[?FunctionName=='$lambdaFunctionName'].FunctionName").Count -gt 1) {
    Write-Output "A função Lambda $lambdaFunctionName já foi criada!"
    aws lambda list-functions --query "Functions[?FunctionName=='$lambdaFunctionName'].FunctionName" --output text
} else {
    Write-Output "Listando todas as funções lambdas criadas"
    aws lambda list-functions --query "Functions[].FunctionName" --output text

    Write-Output "Verificando se existe o arquivo zip da função lambda $lambdaFunctionName..."
    if (-Not (Test-Path $zipFilePath)) {
        Write-Output "Compressionando a pasta do projeto"
        Compress-Archive -Path $filePath -DestinationPath $zipFilePath
    } else {
        Write-Output "O arquivo ZIP já existe!"
    }

    Write-Output "Criando a função lambda $lambdaFunctionName"
    $arnRole = aws iam list-roles --query "Roles[?RoleName=='$roleName'].Arn" --output text
    aws lambda create-function --function-name $lambdaFunctionName --runtime nodejs14.x --architecture x86_64 --role $arnRole --handler index.handler --description "Boot 011 DIO AWS Função Lambda Put Items" --zip-file "fileb://$zipFilePath" --region $region --no-cli-pager

    Write-Output "Listando apenas a função lambda $lambdaFunctionName"
    aws lambda list-functions --query "Functions[?FunctionName=='$lambdaFunctionName'].FunctionName" --output text
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
        Write-Output "Verificando se existe o método POST no recurso (Ignorando erro)..."
        # Write-Output "Extraindo o ID do recurso $resourceApiName para criação de um método para ela"
        $resourceId = aws apigateway get-resources --rest-api-id $apiId --query "items[?pathPart=='$resourceApiName'].id" --output text
        if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST 2>&1) -match "NotFoundException"){
            Write-Output "O método POST para o recurso $resourceApiName da API $apiGatewayName não foi encontrada!"

            Write-Output "Listando todos os métodos do recurso $resourceApiName da API $apiGatewayName"
            aws apigateway get-resource --rest-api-id $apiId --resource-id $resourceId

            Write-Output "Criando o método POST para o recurso $resourceApiName da API $apiGatewayName"
            aws apigateway put-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --authorization-type "NONE"

            Write-Output "Listando apenas o método POST do recurso $resourceApiName da API $apiGatewayName"
            aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "httpMethod" --output text
        } else {
            Write-Output "Verificando se existe o método POST no recurso..."
            if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST).Count -gt 1) {
                Write-Output "Já existe um método POST do recurso $resourceApiName da API $apiGatewayName!"
                aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "httpMethod" --output text
            } else {
                Write-Output "Listando todos os métodos do recurso $resourceApiName da API $apiGatewayName"
                aws apigateway get-resource --rest-api-id $apiId --resource-id $resourceId

                Write-Output "Criando o método POST para o recurso $resourceApiName da API $apiGatewayName"
                aws apigateway put-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --authorization-type "NONE"

                Write-Output "Listando apenas o método POST do recurso $resourceApiName da API $apiGatewayName"
                aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "httpMethod" --output text
            }
        }
    } else {   
        Write-Output "Não existe o recurso $resourceApiName na API Gateway $apiGatewayName"
    }
} else {
    Write-Output "Não existe a API Gateway $apiGatewayName!"
}




"-----//-----//-----//-----//-----//-----//-----"
Write-Output "SERVIÇO: AWS LAMBDA"
"-----//-----//-----//-----//-----//-----//-----"
Write-Output "RESOURCE-BASED POLICY"
Write-Output "Verificando se existe a função lambda $lambdaFunctionName..."
if ((aws lambda list-functions --query "Functions[?FunctionName=='$lambdaFunctionName'].FunctionName").Count -gt 1) {
    Write-Output "Verificando se existe uma política baseada em recursos (Ignorando erro)..."
    if ((aws lambda get-policy --function-name $lambdaFunctionName 2>&1) -match "NotFoundException"){
        Write-Output "A política baseada em recursos da função lambda $lambdaFunctionName não foi encontrada!"

        Write-Output "Criando a política baseada em recursos da função lambda $lambdaFunctionName para liberar a API Gateway"
        $apiId = aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].id" --output text
        aws lambda add-permission --function-name $lambdaFunctionName --action lambda:InvokeFunction --principal apigateway.amazonaws.com --statement-id apigateway-test-1 --source-arn arn:aws:execute-api:${region}:${awsAccountId}:${apiId}/*/POST/${resourceApiName}

        Write-Output "Listando todas as políticas baseadas em recursos da função lambda $lambdaFunctionName"
        aws lambda get-policy --function-name $lambdaFunctionName --query "Policy" | ConvertFrom-Json | jq -r '.Statement[].Sid' 
    } else {
        Write-Output "Verificando se existe uma política baseada em recursos..."
        if ((aws lambda get-policy --function-name $lambdaFunctionName).Count -gt 1) {
            Write-Output "Já existe uma política baseada em recursos da função lambda $lambdaFunctionName"
            aws lambda get-policy --function-name $lambdaFunctionName --query "Policy" | ConvertFrom-Json | jq -r '.Statement[].Sid' 
        } else {
            Write-Output "Listando todas as políticas baseadas em recursos da função lambda $lambdaFunctionName"
            aws lambda get-policy --function-name $lambdaFunctionName

            Write-Output "Criando a política baseada em recursos da função lambda $lambdaFunctionName para liberar a API Gateway"
            $apiId = aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].id" --output text
            aws lambda add-permission --function-name $lambdaFunctionName --action lambda:InvokeFunction --principal apigateway.amazonaws.com --statement-id apigateway-test-1 --source-arn arn:aws:execute-api:${region}:${awsAccountId}:${apiId}/*/POST/${resourceApiName}

            Write-Output "Listando todas as políticas baseadas em recursos da função lambda $lambdaFunctionName"
            aws lambda get-policy --function-name $lambdaFunctionName --query "Policy" | ConvertFrom-Json | jq -r '.Statement[].Sid' 
        }
    }
} else {
    Write-Output "Não existe a função Lambda $lambdaFunctionName!"
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
            Write-Output "INTEGRATION REQUEST"
            Write-Output "Verificando se existe a integração de solicitação para o método POST do recurso $resourceApiName..."
            if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration.type=='$methodIntegrationType'") -eq 'true') {
                Write-Output "Já existe uma integração de solicitação do tipo $methodIntegrationType para o método POST do recurso $resourceApiName!"
                aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration" --no-cli-pager
            } else {
                Write-Output "Exibindo a integração de solicitação do tipo $methodIntegrationType para o método POST do recurso $resourceApiName"
                aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration"

                Write-Output "Configurando a integração de solicitação para o método POST do recurso $resourceApiName com o serviço Lambda"
                $arnLambda = aws lambda list-functions --query "Functions[?FunctionName=='$lambdaFunctionName'].FunctionArn" --output text
                aws apigateway put-integration --rest-api-id $apiId --resource-id $resourceId --http-method POST --type $methodIntegrationType --integration-http-method POST --uri "arn:aws:apigateway:${region}:lambda:path/2015-03-31/functions/${arnLambda}/invocations"

                Write-Output "Exibindo a integração de solicitação do tipo $methodIntegrationType para o método POST do recurso $resourceApiName"
                aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration"
            }

            "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "INTEGRATION RESPONSE"
            Write-Output "Verificando se existe a integração de resposta para o método POST do recurso $resourceApiName (Ignorando erro)..."
            if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration.integrationResponses" 2>&1) -match "NotFoundException"){
                Write-Output "A integração de resposta para o método POST do recurso $resourceApiName não foi encontrada!"

                Write-Output "Configurando a integração de resposta do método POST do recurso $resourceApiName"
                aws apigateway put-integration-response --rest-api-id $apiId --resource-id $resourceId --http-method POST --status-code 200 --selection-pattern "" --response-templates '{"application/json": ""}'

                Write-Output "Exibindo a integração de resposta para o método POST do recurso $resourceApiName"
                aws apigateway get-integration-response --rest-api-id $apiId --resource-id $resourceId --http-method POST --status-code 200
            } else {
                Write-Output "Verificando se existe a integração de resposta para o método POST do recurso $resourceApiName..."
                if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration.integrationResponses").Count -gt 1) {
                    Write-Output "Já existe uma integração de resposta para o método POST do recurso $resourceApiName!"
                    aws apigateway get-integration-response --rest-api-id $apiId --resource-id $resourceId --http-method POST --status-code 200
                } else {
                    # Write-Output "Exibindo a integração de resposta para o método POST do recurso $resourceApiName"
                    # aws apigateway get-integration-response --rest-api-id $apiId --resource-id $resourceId --http-method POST --status-code 200

                    Write-Output "Configurando a integração do método POST do $resourceApiName"
                    aws apigateway put-integration-response --rest-api-id $apiId --resource-id $resourceId --http-method POST --status-code 200 --selection-pattern "" --response-templates '{"application/json": ""}'

                    Write-Output "Exibindo a integração de resposta para o método POST do recurso $resourceApiName"
                    aws apigateway get-integration-response --rest-api-id $apiId --resource-id $resourceId --http-method POST --status-code 200
                } 
            }
            
            "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "DEPLOYMENT"
            Write-Output "Verificando se existe a integração de resposta para o método POST do recurso $resourceApiName..."
            if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration.integrationResponses").Count -gt 1) {
                Write-Output "Verificando se existe um deployment..."
                if ((aws apigateway get-deployments --rest-api-id $apiId --query "items").Count -gt 1) {
                    Write-Output "Já existe o estágio de deployment $stageName para a API $apiGatewayName!"
                    aws apigateway get-deployments --rest-api-id $apiId --query "items"
                } else {
                    Write-Output "Listando todos os deployments da API $apiGatewayName"
                    aws apigateway get-deployments --rest-api-id $apiId --query "items"
    
                    Write-Output "Criando o estágio de deployment $stageName para a API $apiGatewayName"
                    aws apigateway create-deployment --rest-api-id $apiId --stage-name $stageName
    
                    Write-Output "Listando todos os estágios do deployment $stageName da API $apiGatewayName"
                    aws apigateway get-stage --rest-api-id $apiId --stage-name development --query "stageName" --output text

                    Write-Output "Exibindo a Invoke URL do deployment $stageName para o método POST do recurso $resourceApiName da API $apiGatewayName"
                    Write-Output "https://$apiId.execute-api.$region.amazonaws.com/$stageName/$resourceApiName"
                }
            } else {
                Write-Output "Não existe ou não há configuração de integração do método POST do recurso $resourceApiName na API $apiGatewayName"
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
Write-Output "SERVIÇO: AMAZON COGNITO"
"-----//-----//-----//-----//-----//-----//-----"
Write-Output "USER-POOL"
Write-Output "Verificando se existe a User-Pool $userPoolName..."
if ((aws cognito-idp list-user-pools --max-results 10 --query "UserPools[?Name=='$userPoolName'].Name").Count -gt 1) {
    Write-Output "Já existe a User Pool $userPoolName!"
    aws cognito-idp list-user-pools --max-results 10 --query "UserPools[?Name=='$userPoolName'].Name" --output text
    
} else {
    Write-Output "Listando pelo menos 20 User Pools"
    aws cognito-idp list-user-pools --max-results 10 --query "UserPools[].Name" --output text

    Write-Output "Criando a User Pool $userPoolName"
    aws cognito-idp create-user-pool --pool-name $userPoolName --policies '{"PasswordPolicy":{"MinimumLength":8,"RequireUppercase":true,"RequireLowercase":true,"RequireNumbers":true,"RequireSymbols":false,"TemporaryPasswordValidityDays":7}}' --email-configuration 'EmailSendingAccount=COGNITO_DEFAULT' --auto-verified-attributes email --username-attributes email --mfa-configuration OFF --account-recovery-setting '{"RecoveryMechanisms":[{"Priority":1,"Name":"verified_email"}]}' --verification-message-template '{"DefaultEmailOption":"CONFIRM_WITH_LINK","EmailMessageByLink":"Clique no link a seguir para confirmar seu endereço de e-mail: {##Verify Email##}","EmailSubject":"Confirmação de E-mail"}' --user-attribute-update-settings AttributesRequireVerificationBeforeUpdate=email --no-cli-pager

    Write-Output "Listando a User Pool $userPoolName"
    aws cognito-idp list-user-pools --max-results 10 --query "UserPools[?Name=='$userPoolName'].Name" --output text

    # Write-Output "Alterando configurações da App Client $appClientName da User Pool $userPoolName"
    # $userPoolId = aws cognito-idp list-user-pools --max-results 10 --query "UserPools[?Name=='$userPoolName'].Id" --output text
    # $clientId = aws cognito-idp list-user-pool-clients --user-pool-id $userPoolId --query "UserPoolClients[?ClientName=='$appClientName'].ClientId" --output text
    # aws cognito-idp update-user-pool-client --user-pool-id $userPoolId --client-id $clientId --callback-urls "https://example.com" --allowed-o-auth-flows "code" "implicit" --allowed-o-auth-scopes "openid" "email"
}


"-----//-----//-----//-----//-----//-----//-----"
Write-Output "USER-POOL"
Write-Output "Verificando se existe a User-Pool $userPoolName..."
if ((aws cognito-idp list-user-pools --max-results 10 --query "UserPools[?Name=='$userPoolName'].Name").Count -gt 1) {
    "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "CLIENT"
    Write-Output "Verificando se existe o Client $appClientName..."
    $userPoolId = aws cognito-idp list-user-pools --max-results 10 --query "UserPools[?Name=='$userPoolName'].Id" --output text
    if ((aws cognito-idp list-user-pool-clients --user-pool-id $userPoolId --query "UserPoolClients[?ClientName=='$appClientName'].ClientName").Count -gt 1) {
        Write-Output "Já existe o Client $appClientName da User Pool $userPoolName!"
        aws cognito-idp list-user-pool-clients --user-pool-id $userPoolId --query "UserPoolClients[?ClientName=='$appClientName'].ClientName" --output text

        Write-Output "Listando o Id do Client $appClientName da User Pool $userPoolName"
        aws cognito-idp list-user-pool-clients --user-pool-id $userPoolId --query "UserPoolClients[?ClientName=='$appClientName'].AppClientId" --output text
    } else {
        Write-Output "Listando todos os Clients da User Pool $userPoolName"
        aws cognito-idp list-user-pool-clients --user-pool-id $userPoolId --query "UserPoolClients[].ClientName" --output text

        Write-Output "Criando o Client $appClientName da User Pool $userPoolName"
        # aws cognito-idp create-user-pool-client --user-pool-id $userPoolId --client-name $appClientName --allowed-o-auth-flows "code" "implicit" --allowed-o-auth-scopes "openid" "email" --callback-urls "https://example.com" --supported-identity-providers 'COGNITO' --no-cli-pager
        aws cognito-idp create-user-pool-client --user-pool-id $userPoolId --client-name $appClientName --allowed-o-auth-flows "code" "implicit" --allowed-o-auth-scopes "openid" "email" --callback-urls "https://oauth.pstmn.io/v1/browser-callback" --supported-identity-providers 'COGNITO' --no-cli-pager

        Write-Output "Listando apenas o Client $appClientName da User Pool $userPoolName"
        aws cognito-idp list-user-pool-clients --user-pool-id $userPoolId --query "UserPoolClients[?ClientName=='$appClientName'].ClientName" --output text

        Write-Output "Listando o Id do Client $appClientName da User Pool $userPoolName"
        aws cognito-idp list-user-pool-clients --user-pool-id $userPoolId --query "UserPoolClients[?ClientName=='$appClientName'].AppClientId" --output text
    }


    "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "DOMAIN"
    Write-Output "Verificando se existe o domínio $domainUserPool para User-Pool..."
    $userPoolId = aws cognito-idp list-user-pools --max-results 10 --query "UserPools[?Name=='$userPoolName'].Id" --output text
    if ((aws cognito-idp describe-user-pool --user-pool-id $userPoolId --query "UserPool.Domain=='$domainUserPool'") -eq "true") {
        Write-Output "Já existe o domínio $domainUserPool da User Pool $userPoolName!"
        aws cognito-idp describe-user-pool --user-pool-id $userPoolId --query "UserPool.Domain" --output text

        Write-Output "Exibindo o link do domínio $domainUserPool da User Pool $userPoolName"
        Write-Output "https://$domainUserPool.auth.$region.amazoncognito.com"
    } else {
        Write-Output "Listando todos os domínios da User Pool $userPoolName"
        aws cognito-idp describe-user-pool --user-pool-id $userPoolId --query "UserPool.Domain" --output text

        Write-Output "Criando o domínio $domainUserPool da API Client $appClientName da User Pool $userPoolName"
        aws cognito-idp create-user-pool-domain --domain "$domainUserPool" --user-pool-id $userPoolId

        Write-Output "Listando todos os domínios da User Pool $userPoolName"
        aws cognito-idp describe-user-pool --user-pool-id $userPoolId --query "UserPool.Domain" --output text

        Write-Output "Exibindo o link do domínio $domainUserPool da User Pool $userPoolName"
        Write-Output "https://$domainUserPool.auth.$region.amazoncognito.com"
    }
} else {
    Write-Output "Não existe a User Pool $userPoolName!"
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
        Write-Output "AUTHORIZER"
        Write-Output "Verificando se existe a Authorizer $authorizerName..."
        if ((aws apigateway get-authorizers --rest-api-id $apiId --query "items").Count -gt 1) {
            Write-Output "Já existe a Authorizer $authorizerName da API $apiGatewayName!"
            aws apigateway get-authorizers --rest-api-id $apiId --query "items[?name=='$authorizerName'].name" --output text
        } else {
            Write-Output "Listando todas as Authorizers da API $apiGatewayName"
            aws apigateway get-authorizers --rest-api-id $apiId --query "items[].name" --output text

            Write-Output "Criando a Authorizer $authorizerName da API $apiGatewayName"
            $arnUserPool = aws cognito-idp describe-user-pool --user-pool-id us-east-1_TcCgJC5fR --query "UserPool.Arn" --output text
            aws apigateway create-authorizer --rest-api-id $apiId --name $authorizerName --type COGNITO_USER_POOLS --identity-source "method.request.header.Authorization" --provider-arns $arnUserPool

            Write-Output "Listando apenas a Authorizer $authorizerName da API $apiGatewayName"
            aws apigateway get-authorizers --rest-api-id $apiId --query "items[?name=='$authorizerName'].name" --output text
        }

        "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "METHOD REQUEST POST - AUTHORIZATION"
        # Write-Output "Extraindo o ID do recurso $resourceApiName para criação de um método para ela"
        $resourceId = aws apigateway get-resources --rest-api-id $apiId --query "items[?pathPart=='$resourceApiName'].id" --output text
        $idAuthorizer = aws apigateway get-authorizers --rest-api-id $apiId --query "items[?name=='$authorizerName'].id" --output text
        Write-Output "Verificando se existe a configuração de autorização para o método de solicitação do POST do recurso $resourceApiName..."
        if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "authorizerId=='$idAuthorizer'") -eq 'true') {
            Write-Output "Já existe a configuração de autorização para o método de solicitação do POST do recurso $resourceApiName!"
            aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "authorizerId" --output text
        } else {
            Write-Output "Exibindo a configuração de autorização para o método de solicitação do POST do recurso $resourceApiName"
            aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "authorizerId" --output text

            Write-Output "Configurando autorização para o método de solicitação do POST do recurso $resourceApiName"
            aws apigateway update-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --patch-operations "op=replace,path=/authorizerId,value=$idAuthorizer" op=replace,path=/authorizationType,value=COGNITO_USER_POOLS --no-cli-pager

            Write-Output "Exibindo a configuração de autorização para o método de solicitação do POST do recurso $resourceApiName"
            aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "authorizerId" --output text

            Write-Output "Realizando o deployment do estágio $stageName para a API $apiGatewayName"
            aws apigateway create-deployment --rest-api-id $apiId --stage-name $stageName
        }
    } else {   
        Write-Output "Não existe o recurso $resourceApiName na API Gateway $apiGatewayName"
    }
} else {
    Write-Output "Não existe a API Gateway $apiGatewayName!"
}





