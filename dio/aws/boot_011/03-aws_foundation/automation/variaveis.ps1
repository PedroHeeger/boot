# Defina suas variáveis
# PATHS
$buildEnvPath = "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\automation"
$resourcesPath = "$buildEnvPath\resources"
$secretsPath = "$buildEnvPath\secrets"
$projectPath = "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\projectDioServerless"
$awsCliPath = "$secretsPath\.aws"

# FILES PATHS
$keyPairPath = "$secretsPath"
$userDataPath = "$resourcesPath"

# FILES
$userDataFile = "ec2Script.sh"

# DATA
$keyPairName = "remoteAccessEc2"
$tagNameInstance = "dioServerless3"
$imageId = "ami-053b0d53c279acc90"
$availabilityZone = "us-east-1a"