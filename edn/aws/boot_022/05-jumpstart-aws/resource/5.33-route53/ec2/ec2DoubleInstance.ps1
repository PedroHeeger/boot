#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2"
Write-Output "EC2 DOUBLE CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$tagNameInstance = "mompopcafeserver"
$instanceA = "cafeserver1"
$instanceB = "cafeserver2"
$sgName = "default"
$aZA = "us-east-1a"
$aZB = "us-east-1b"
$imageId = "ami-0195204d5dce06d99"    # Amazon Linux 2 Kernel 5.10 AMI 2.0.20240620.0 x86_64 HVM gp2
$instanceType = "t2.micro"
$keyPairPath = "G:/Meu Drive/4_PROJ/scripts/scripts_model/.default/secrets/awsKeyPair"
$keyPairName = "keyPairUniversal"
$userDataPath = "G:/Meu Drive/4_PROJ/boot/edn/aws/boot_022/05-jumpstart-aws/resource/5.33-route53/ec2/"
$userDataFile = "udFile.sh"
$deviceName = "/dev/xvda"
$volumeSize = 8
$volumeType = "gp2"
$instanceProfileName = "instanceProfileEdn1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    $condition = aws ec2 describe-instances --query "Reservations[].Instances[?(Tags[?Key=='Name' && (Value=='${tagNameInstance}${instanceA}' || Value=='${tagNameInstance}${instanceB}')])].[Tags[?Key=='Name'].Value | [0]]" --output text
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe as instâncias ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe uma instância EC2 com o nome de tag ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name' && Value=='${tagNameInstance}${instanceA}'].Value" --output text
        aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name' && Value=='${tagNameInstance}${instanceB}'].Value" --output text
        
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o IP público das instâncias ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceA}" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
        aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceB}" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Exibindo o comando para acesso remoto via OpenSSH na instância ${tagNameInstance}${instanceA}"
        $ipEc2A = aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceA}" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
        Write-Output "ssh -i `"$keyPairPath\$keyPairName.pem`" ubuntu@$ipEc2A"

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Exibindo o comando para acesso remoto via OpenSSH na instância ${tagNameInstance}${instanceB}"
        $ipEc2B = aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceB}" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
        Write-Output "ssh -i `"$keyPairPath\$keyPairName.pem`" ubuntu@$ipEc2B"
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome da tag de todas as instâncias EC2 criadas"
        aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id dos elementos de rede"
        $sgId = aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --output text
        $subnetIdA = aws ec2 describe-subnets --query "Subnets[?AvailabilityZone=='$aZA'].SubnetId" --output text
        $subnetIdB = aws ec2 describe-subnets --query "Subnets[?AvailabilityZone=='$aZB'].SubnetId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando a instância EC2 de nome de tag ${tagNameInstance}${instanceA}"
        aws ec2 run-instances --image-id $imageId --instance-type $instanceType --key-name $keyPairName --security-group-ids $sgId --subnet-id $subnetIdA --count 1 --user-data "file://$userDataPath\$userDataFile" --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${tagNameInstance}${instanceA}}]" --block-device-mappings "[{`"DeviceName`":`"$deviceName`",`"Ebs`":{`"VolumeSize`":$volumeSize,`"VolumeType`":`"$volumeType`"}}]" --iam-instance-profile Name=$instanceProfileName --no-cli-pager

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando a instância EC2 de nome de tag ${tagNameInstance}${instanceB}"
        aws ec2 run-instances --image-id $imageId --instance-type $instanceType --key-name $keyPairName --security-group-ids $sgId --subnet-id $subnetIdB --count 1 --user-data "file://$userDataPath\$userDataFile" --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${tagNameInstance}${instanceB}}]" --block-device-mappings "[{`"DeviceName`":`"$deviceName`",`"Ebs`":{`"VolumeSize`":$volumeSize,`"VolumeType`":`"$volumeType`"}}]" --iam-instance-profile Name=$instanceProfileName --no-cli-pager
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome da tag de todas as instâncias EC2 criadas"
        aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o IP público das instâncias ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceA}" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
        aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceB}" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Exibindo o comando para acesso remoto via OpenSSH na instância ${tagNameInstance}${instanceA}"
        $ipEc2A = aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceA}" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
        Write-Output "ssh -i `"$keyPairPath\$keyPairName.pem`" ubuntu@$ipEc2A"

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Exibindo o comando para acesso remoto via OpenSSH na instância ${tagNameInstance}${instanceB}"
        $ipEc2B = aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceB}" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
        Write-Output "ssh -i `"$keyPairPath\$keyPairName.pem`" ubuntu@$ipEc2B"
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2"
Write-Output "EC2 DOUBLE EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$tagNameInstance = "mompopcafeserver"
$instanceA = "1"
$instanceB = "2"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    $condition = aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[?(Tags[?Key=='Name' && (Value=='${tagNameInstance}${instanceA}' || Value=='${tagNameInstance}${instance}2')])].[Tags[?Key=='Name'].Value | [0]]" --output text
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe as instâncias ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome da tag de todas as instâncias EC2 criadas"
        aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text
        
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id das instâncias de nome de tag ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        $instanceId1 = aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceA}" --query "Reservations[].Instances[].InstanceId" --output text
        $instanceId2 = aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceB}" --query "Reservations[].Instances[].InstanceId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo as instâncias de nome de tag ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        aws ec2 terminate-instances --instance-ids $instanceId1 $instanceId2 --no-dry-run --no-cli-pager
        
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome da tag de todas as instâncias EC2 criadas"
        aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text
    } else {Write-Output "Não existe instâncias com o nome de tag ${tagNameInstance}${instanceA} ou ${tagNameInstance}${instanceB}"}
} else {Write-Host "Código não executado"}