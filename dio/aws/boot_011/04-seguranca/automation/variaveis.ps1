# Defina suas variáveis
# PATHS
$buildEnvPath = "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\04-seguranca\automation"
$resourcesPath = "$buildEnvPath\resources"
$projectPath = "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\04-seguranca\projectDioCognito"

# FILES PATHS
$filePath = "$projectPath\index.js"
$zipFilePath = "$resourcesPath\index.zip"

# FILES

# DATA
$awsAccountId = "005354053245"
$apiGatewayName = "dioLiveApiNew"
$resourceApiName = "items"
$region = "us-east-1"
$tableName = "dioItems"
$lambdaFunctionName = "dioPutItemsFunction"
$roleName = "dioPutItemsRole"
$policyName = "dioPutItemsPolicy"
$userName = "PedroheegerAdmin"
$methodIntegrationType = "AWS_PROXY"
$stageName = "development"
$userPoolName = "dioLiveUserPool1"
$appClientName = "dioLiveAppClient1"
$domainUserPool = "diolivenewboot011"
$authorizerName = "dioCognitoAuthorizer"