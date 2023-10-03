# Defina suas variáveis
# PATHS
$buildEnvPath = "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\04-seguranca\automation"
$resourcesPath = "$buildEnvPath\resources"
# $secretsPath = "$buildEnvPath\secrets"
$projectPath = "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\04-seguranca\projectDioCognito"
$zipFilePath = "$resourcesPath\projectDioCognito.zip"
# $awsCliPath = "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\automation\secrets\.aws"


# FILES PATHS
$keyPairPath = "$secretsPath"
$userDataPath = "$resourcesPath"

# FILES
$userDataFile = "ec2Script.sh"

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




$keyPairName = "remoteAccessEc2"
$tagNameInstance = "dioServerless1"
$imageId = "ami-053b0d53c279acc90"
$availabilityZone = "us-east-1a"
