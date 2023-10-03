Write-Output "Importando o arquivo com as variáveis"
. "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\04-seguranca\automation\variaveis.ps1"

# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "SERVIÇO: AWS API GATEWAY"
# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "API"
# if ((aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].name").Count -gt 1) {
#     Write-Output "A API Gateway $apiGatewayName já foi criada!"
#     aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].name" --output text
# } else {
#     Write-Output "Listando todas as APIs Gateway criadas"
#     aws apigateway get-rest-apis --query "items[].name" --output text

#     Write-Output "Criando a API Gateway $apiGatewayName"
#     aws apigateway create-rest-api --name "$apiGatewayName" --description "API criada no Bootcamp 011 de AWS" --endpoint-configuration "types=REGIONAL" --region $region --no-cli-pager

#     Write-Output "Listando apenas a API Gateway $apiGatewayName"
#     aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].name" --output text
# }


# if ((aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].name").Count -gt 1) {
#     "-----//-----//-----//-----//-----//-----//-----"
#     Write-Output "API RESOURCE"
#     Write-Output "Extraindo o ID da API $apiGatewayName para criação de um recurso para ela"
#     $resourceId = aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].id" --output text
#     echo "$resourceId"
    
#     if ((aws apigateway get-resources --rest-api-id $resourceId --query "items[?pathPart=='$resourceApiName'].id").Count -gt 1) {
#         Write-Output "A API Gateway $apiGatewayName já possui o recurso $resourceApiName!"
#         aws apigateway get-resources --rest-api-id $resourceId --query "items[?pathPart=='$resourceApiName'].pathPart" --output text
#     } else {
#         Write-Output "Listando todos os recursos da API Gateway $apiGatewayName"
#         aws apigateway get-resources --rest-api-id $resourceId --query "items[].pathPart" --output text
    
#         Write-Output "Extraindo o ID do recursos raíz (/) da API Gateway $apiGatewayName"
#         $parentId = aws apigateway get-resources --rest-api-id 4qle4njnb1 --query "items[?path=='/'].id" --output text      
#         echo "$parentId"

#         Write-Output "Criando o recurso $resourceApiName da API Gateway $apiGatewayName"
#         aws apigateway create-resource --rest-api-id $resourceId --parent-id $parentId --path-part $resourceApiName
    
#         Write-Output "Listando apenas o recurso $resourceApiName da API Gateway $apiGatewayName"
#         aws apigateway get-resources --rest-api-id $resourceId --query "items[?pathPart=='$resourceApiName'].pathPart" --output text
#     }
# } else {
#     Write-Output "Não existe a API Gateway $apiGatewayName!"
# }




# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "SERVIÇO: AMAZON DYNAMODB"
# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "AMAZON DYNAMODB"
# if ((aws dynamodb describe-table --table-name $tableName --region $region).Count -gt 1) {
#     Write-Output "A tabela $tableName já foi criada!"
#     aws dynamodb describe-table --table-name $tableName --region $region --query "Table.TableName" --output text
# } else {
#     Write-Output "Listando todas as tabelas criadas"
#     aws dynamodb list-tables --region $region --query "TableNames" --output text

#     Write-Output "Criando a tabela $tableName"
#     aws dynamodb create-table --table-name $tableName --attribute-definitions AttributeName=id,AttributeType=S --key-schema AttributeName=id,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 --region $region --no-cli-pager

#     Write-Output "Listando apenas a tabela $tableName"
#     aws dynamodb describe-table --table-name $tableName --region $region --query "Table.TableName" --output text
# }




# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "SERVIÇO: AWS Identity and Access Management (IAM)"
# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "POLICY"
# if ((aws iam list-policies --query "Policies[?PolicyName=='$policyName'].PolicyName").Count -gt 1) {
#     Write-Output "A policy $policyName já foi criada!"
#     aws iam list-policies --query "Policies[?PolicyName=='$policyName'].PolicyName" --output text
# } else {
#     Write-Output "Listando todas as policies criadas"
#     aws iam list-policies --query "Policies[?contains(Arn, ':$awsAccountId')].PolicyName" --output text

#     Write-Output "Criando a policy $policyName"
#     $jsonString = '{
#         "Version": "2012-10-17",
#         "Statement": [
#           {
#             "Effect": "Allow",
#             "Action": "dynamodb:PutItem",
#             "Resource": "arn:aws:dynamodb:' + $region + ':' + $awsAccountId + ':table/' + $tableName + '"
#           }
#         ]
#       }'
#     # echo $jsonString

#     aws iam create-policy --policy-name $policyName --policy-document $jsonString --no-cli-pager

#     Write-Output "Listando apenas a policy $policyName"
#     aws iam list-policies --query "Policies[?PolicyName=='$policyName'].PolicyName" --output text
# }


# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "ROLE"
# if ((aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName").Count -gt 1) {
#     Write-Output "A role $roleName já foi criada!"
#     aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName" --output text
# } else {
#     Write-Output "Listando todas as roles criadas"
#     aws iam list-roles --query 'Roles[].RoleName' --output text

#     Write-Output "Criando a role $roleName para o serviço do Lambda"
#     aws iam create-role --role-name $roleName --no-cli-pager --assume-role-policy-document '{
#       "Version": "2012-10-17",
#       "Statement": [
#         {
#           "Effect": "Allow",
#           "Principal": {
#             "Service": "lambda.amazonaws.com"
#           },
#           "Action": "sts:AssumeRole"
#         }
#       ]
#     }'

#     Write-Output "Listando apenas a role $roleName"
#     aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName" --output text
# }


# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "POLICY - ROLE"
# if ((aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName").Count -gt 1) {
#     if ((aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName").Count -gt 1) {
#         Write-Output "A role $roleName já possui a policy $policyName atribuída!"
#     } else {
#         Write-Output "Listando todas as policies vinculada a role $roleName"
#         aws iam list-attached-role-policies --role-name $roleName --query 'AttachedPolicies[].PolicyName' --output text
        
#         Write-Output "Atribuindo a policy $policyName a role $roleName"
#         $arnPolicy = aws iam list-policies --query "Policies[?PolicyName=='$policyName'].Arn" --output text
#         aws iam attach-role-policy --role-name $roleName --policy-arn $arnPolicy
        
#         Write-Output "Listando apenas a policy $policyName vinculada a role $roleName"
#         aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName" --output text
#     }
# } else {
#     Write-Output "A role $roleName não foi criada. Portanto a $policyName não pode ser atribuída!"
# }




# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "SERVIÇO: AWS LAMBDA"
# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "FUNCTION"
# if ((aws lambda list-functions --query "Functions[?FunctionName=='$lambdaFunctionName'].FunctionName").Count -gt 1) {
#     Write-Output "A função Lambda $lambdaFunctionName já foi criada!"
#     aws lambda list-functions --query "Functions[?FunctionName=='$lambdaFunctionName'].FunctionName" --output text
# } else {
#     Write-Output "Listando todas as funções Lambdas criadas"
#     aws lambda list-functions --query "Functions[].FunctionName" --output text

#     # Verifica se o arquivo ZIP já existe
#     if (-Not (Test-Path $zipFilePath)) {
#         Write-Output "Compressionando a pasta do projeto"
#         Compress-Archive -Path $projectPath -DestinationPath $zipFilePath
#     } else {
#         Write-Output "O arquivo ZIP já existe!"
#     }

#     Write-Output "Criando a função Lambda $lambdaFunctionName"
#     $arnRole = aws iam list-roles --query "Roles[?RoleName=='$roleName'].Arn" --output text

#     aws lambda create-function --function-name $lambdaFunctionName --runtime nodejs14.x --architecture x86_64 --role $arnRole --handler index.handler --description "Boot 011 DIO AWS Função Lambda Put Items" --zip-file "fileb://$resourcesPath/projectDioCognito.zip" --region $region --no-cli-pager

#     Write-Output "Listando apenas a função Lambda $lambdaFunctionName"
#     aws lambda list-functions --query "Functions[?FunctionName=='$lambdaFunctionName'].FunctionName" --output text
# }




# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "SERVIÇO: AWS API GATEWAY"
# "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "API GATEWAY"
# if ((aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].name").Count -gt 1) {
#     "-----//-----//-----//-----//-----//-----//-----"
#     Write-Output "API RESOURCE"
#     Write-Output "Extraindo o ID da API $apiGatewayName para criação de um recurso para ela"
#     $apiId = aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].id" --output text
#     echo "$apiId"
    
#     if ((aws apigateway get-resources --rest-api-id $apiId --query "items[?pathPart=='$resourceApiName'].id").Count -gt 1) {
#         "-----//-----//-----//-----//-----//-----//-----"
#         Write-Output "API RESOURCE METHOD"
#         Write-Output "Extraindo o ID do recurso $resourceApiName para criação de um método para ela"
#         $resourceId = aws apigateway get-resources --rest-api-id $apiId --query "items[?pathPart=='$resourceApiName'].id" --output text
#         echo "$resourceId"

#         if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST).Count -gt 1) {
#             Write-Output "Já existe um método POST do recurso $resourceApiName da API $apiGatewayName!"
#             aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "httpMethod" --output text

#             "-----//-----//-----//-----//-----//-----//-----"
#             Write-Output "API RESOURCE METHOD INTEGRATION"
#             if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration.type=='$methodIntegrationType'") -eq 'true') {
#                 Write-Output "Já existe uma integração do tipo $methodIntegrationType para o método POST do recurso $resourceApiName!"
#                 aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration"
#             } else {
#                 Write-Output "Exibindo a integração do tipo $methodIntegrationType para o método POST do recurso $resourceApiName!"
#                 aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration"

#                 Write-Output "Configurando a integração do método POST com o serviço Lambda"
#                 $arnLambda = aws lambda list-functions --query "Functions[?FunctionName=='$lambdaFunctionName'].FunctionArn" --output text
#                 echo "arn:aws:apigateway:${region}:lambda:path/2015-03-31/functions/${arnLambda}/invocations"
#                 aws apigateway put-integration --rest-api-id $apiId --resource-id $resourceId --http-method POST --type $methodIntegrationType --integration-http-method POST --uri "arn:aws:apigateway:${region}:lambda:path/2015-03-31/functions/${arnLambda}/invocations"

#                 Write-Output "Exibindo a integração do tipo $methodIntegrationType para o método POST do recurso $resourceApiName!"
#                 aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration"
#             }

#         } else {
#             Write-Output "Listando todos os métodos do recurso $resourceApiName da API $apiGatewayName"
#             aws apigateway get-resource --rest-api-id $apiId --resource-id $resourceId --query 'resourceMethods' --output text

#             Write-Output "Criando o método POST para o recurso $resourceApiName da API $apiGatewayName"
#             aws apigateway put-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --authorization-type "NONE"

#             Write-Output "Listando apenas o método POST do recurso $resourceApiName da API $apiGatewayName"
#             aws apigateway get-resource --rest-api-id $apiId --resource-id $resourceId --query "resourceMethods=='POST'" --output text

#             "-----//-----//-----//-----//-----//-----//-----"
#             Write-Output "API RESOURCE METHOD INTEGRATION"
#             if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration.type=='$methodIntegrationType'") -eq 'true') {
#                 Write-Output "Já existe uma integração do tipo $methodIntegrationType para o método POST do recurso $resourceApiName!"
#                 aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration"
#             } else {
#                 Write-Output "Exibindo a integração do tipo $methodIntegrationType para o método POST do recurso $resourceApiName!"
#                 aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration"

#                 Write-Output "Configurando a integração do método POST com o serviço Lambda"
#                 $arnLambda = aws lambda list-functions --query "Functions[?FunctionName=='$lambdaFunctionName'].FunctionArn" --output text
#                 echo "arn:aws:apigateway:${region}:lambda:path/2015-03-31/functions/${arnLambda}/invocations"
#                 aws apigateway put-integration --rest-api-id $apiId --resource-id $resourceId --http-method POST --type $methodIntegrationType --integration-http-method POST --uri "arn:aws:apigateway:${region}:lambda:path/2015-03-31/functions/${arnLambda}/invocations"

#                 Write-Output "Exibindo a integração do tipo $methodIntegrationType para o método POST do recurso $resourceApiName!"
#                 aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration"
#             }
#         } 
#     } else {   
#         Write-Output "Não existe o recurso $resourceApiName na API Gateway $apiGatewayName"
#     }
# } else {
#     Write-Output "Não existe a API Gateway $apiGatewayName!"
# }



"-----//-----//-----//-----//-----//-----//-----"
Write-Output "API RESOURCE METHOD INTEGRATION"
if ((aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].name").Count -gt 1) {
    # "-----//-----//-----//-----//-----//-----//-----"
    # Write-Output "API RESOURCE"
    # Write-Output "Extraindo o ID da API $apiGatewayName para criação de um recurso para ela"
    $apiId = aws apigateway get-rest-apis --query "items[?name=='$apiGatewayName'].id" --output text
    
    if ((aws apigateway get-resources --rest-api-id $apiId --query "items[?pathPart=='$resourceApiName'].id").Count -gt 1) {
        # "-----//-----//-----//-----//-----//-----//-----"
        # Write-Output "API RESOURCE METHOD"
        # Write-Output "Extraindo o ID do recurso $resourceApiName para criação de um método para ela"
        $resourceId = aws apigateway get-resources --rest-api-id $apiId --query "items[?pathPart=='$resourceApiName'].id" --output text

        if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST).Count -gt 1) {
            "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "API RESOURCE METHOD INTEGRATION (REQUEST)"
            if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration.type=='$methodIntegrationType'") -eq 'true') {
                Write-Output "Já existe uma integração do tipo $methodIntegrationType para o método POST do recurso $resourceApiName!"
                aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration"
            } else {
                Write-Output "Exibindo a integração do tipo $methodIntegrationType para o método POST do recurso $resourceApiName"
                aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration"

                Write-Output "Configurando a integração do método POST com o serviço Lambda"
                $arnLambda = aws lambda list-functions --query "Functions[?FunctionName=='$lambdaFunctionName'].FunctionArn" --output text
                aws apigateway put-integration --rest-api-id $apiId --resource-id $resourceId --http-method POST --type $methodIntegrationType --integration-http-method POST --uri "arn:aws:apigateway:${region}:lambda:path/2015-03-31/functions/${arnLambda}/invocations"

                Write-Output "Exibindo a integração do tipo $methodIntegrationType para o método POST do recurso $resourceApiName"
                aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration"
            }

            "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "API RESOURCE METHOD INTEGRATION (RESPONSE)"
            if ((aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration.integrationResponses").Count -gt 1) {
                Write-Output "Já existe uma integração Response para o método POST do recurso $resourceApiName!"
                aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration.integrationResponses"
            } else {
                Write-Output "Exibindo a integração Response para o método POST do recurso $resourceApiName"
                aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration.integrationResponses"

                Write-Output "Configurando a integração do método POST com o serviço Lambda"
                $arnLambda = aws lambda list-functions --query "Functions[?FunctionName=='$lambdaFunctionName'].FunctionArn" --output text
                aws apigateway put-integration-response --rest-api-id $apiId --resource-id $resourceId --http-method POST --status-code 200 --selection-pattern "" --response-models '{"application/json": "Empty"}'

                Write-Output "Exibindo a integração Response para o método POST do recurso $resourceApiName"
                aws apigateway get-method --rest-api-id $apiId --resource-id $resourceId --http-method POST --query "methodIntegration.integrationResponses"
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
























