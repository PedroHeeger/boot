#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2"
Write-Output "EC2 DOUBLE CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$tagNameInstance = "cafeServer"
# $tagNameInstance = "ec2Test"
$instanceA = "1"
$instanceB = "2"
$sgName = "default"
$regionA = "us-east-1"
$aZA = "us-east-1a"      # Norte Virginia
$regionB = "eu-west-3"
$aZB = "eu-west-3a"      # Europe (Paris)
$imageIdA = "ami-0195204d5dce06d99"    # Amazon Linux 2 Kernel 5.10 AMI 2.0.20240620.0 x86_64 HVM gp2
$imageIdB = "ami-031813d9986aac8c7"    # Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type
$instanceType = "t2.micro"
$userDataPath = "G:/Meu Drive/4_PROJ/scripts/scripts_model/.default/aws/ec2_ud_app/aws_cafeteria_az"
$userDataFile = "udFile.sh"
$deviceName = "/dev/xvda"
$volumeSize = 8
$volumeType = "gp2"
$instanceProfileName = "instanceProfileEdn1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    $condition = aws ec2 describe-instances --query "Reservations[].Instances[?(Tags[?Key=='Name' && Value=='${tagNameInstance}${instanceA}'])].[Tags[?Key=='Name'].Value | [0]]" --region $regionA --output text && aws ec2 describe-instances --query "Reservations[].Instances[?(Tags[?Key=='Name' && Value=='${tagNameInstance}${instanceB}'])].[Tags[?Key=='Name'].Value | [0]]" --region $regionB --output text
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe as instâncias ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe uma instância EC2 com o nome de tag ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name' && Value=='${tagNameInstance}${instanceA}'].Value" --region $regionA --output text
        aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name' && Value=='${tagNameInstance}${instanceB}'].Value" --region $regionB --output text
        
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o IP público das instâncias ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceA}" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --region $regionA --output text
        aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceB}" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --region $regionB --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome da tag de todas as instâncias EC2 criadas"
        aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --region $regionA --output text
        aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --region $regionB --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id dos elementos de rede"
        $sgIdA = aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --region $regionA --output text
        $subnetIdA = aws ec2 describe-subnets --query "Subnets[?AvailabilityZone=='$aZA'].SubnetId" --region $regionA --output text
        $sgIdB = aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --region $regionB --output text
        $subnetIdB = aws ec2 describe-subnets --query "Subnets[?AvailabilityZone=='$aZB'].SubnetId" --region $regionB --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando a instância EC2 de nome de tag ${tagNameInstance}${instanceA}"
        aws ec2 run-instances --image-id $imageIdA --instance-type $instanceType --security-group-ids $sgIdA --subnet-id $subnetIdA --count 1 --user-data "file://$userDataPath\$userDataFile" --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${tagNameInstance}${instanceA}}]" --block-device-mappings "[{`"DeviceName`":`"$deviceName`",`"Ebs`":{`"VolumeSize`":$volumeSize,`"VolumeType`":`"$volumeType`"}}]" --iam-instance-profile Name=$instanceProfileName --region $regionA --no-cli-pager

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando a instância EC2 de nome de tag ${tagNameInstance}${instanceB}"
        aws ec2 run-instances --image-id $imageIdB --instance-type $instanceType --security-group-ids $sgIdB --subnet-id $subnetIdB --count 1 --user-data "file://$userDataPath\$userDataFile" --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${tagNameInstance}${instanceB}}]" --block-device-mappings "[{`"DeviceName`":`"$deviceName`",`"Ebs`":{`"VolumeSize`":$volumeSize,`"VolumeType`":`"$volumeType`"}}]" --iam-instance-profile Name=$instanceProfileName --region $regionB --no-cli-pager
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome da tag de todas as instâncias EC2 criadas"
        aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --region $regionA --output text
        aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --region $regionB --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o IP público das instâncias ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceA}" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --region $regionA --output text
        aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceB}" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --region $regionB --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2"
Write-Output "EC2 DOUBLE EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$tagNameInstance = "cafeServer"
# $tagNameInstance = "ec2Test"
$instanceA = "1"
$instanceB = "2"
$regionA = "us-east-1"
$regionB = "eu-west-3"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    $condition = aws ec2 describe-instances --query "Reservations[].Instances[?(Tags[?Key=='Name' && Value=='${tagNameInstance}${instanceA}'])].[Tags[?Key=='Name'].Value | [0]]" --region $regionA --output text && aws ec2 describe-instances --query "Reservations[].Instances[?(Tags[?Key=='Name' && Value=='${tagNameInstance}${instanceB}'])].[Tags[?Key=='Name'].Value | [0]]" --region $regionB --output text
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe as instâncias ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome da tag de todas as instâncias EC2 criadas"
        aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --region $regionA --output text
        aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --region $regionB --output text
        
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id das instâncias de nome de tag ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        $instanceIdA = aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceA}" --query "Reservations[].Instances[].InstanceId" --region $regionA --output text
        $instanceIdB = aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceB}" --query "Reservations[].Instances[].InstanceId" --region $regionB --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo as instâncias de nome de tag ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        aws ec2 terminate-instances --instance-ids $instanceIdA --no-dry-run --region $regionA --no-cli-pager
        aws ec2 terminate-instances --instance-ids $instanceIdB --no-dry-run --region $regionB --no-cli-pager
        
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome da tag de todas as instâncias EC2 criadas"
        aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --region $regionA --output text
        aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --region $regionB --output text
    } else {Write-Output "Não existe instâncias com o nome de tag ${tagNameInstance}${instanceA} ou ${tagNameInstance}${instanceB}"}
} else {Write-Host "Código não executado"}