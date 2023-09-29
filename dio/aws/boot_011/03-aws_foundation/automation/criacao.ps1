Write-Output "Importando o arquivo com as variáveis"
. "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\automation\variaveis.ps1"

"-----//-----//-----//-----//-----//-----//-----"
Write-Output "SERVIÇO: AWS EC2"
"-----//-----//-----//-----//-----//-----//-----"
Write-Output "KEY PAIR"
if ((aws ec2 describe-key-pairs --query "KeyPairs[?KeyName=='$keyPairName']").Count -gt 1) {
    Write-Output "O par de chaves $keyPairName já foi criado!"
    aws ec2 describe-key-pairs --query "KeyPairs[?KeyName=='$keyPairName'].KeyName" --output text
} else {
    Write-Output "Listando todos os pares de chaves criados"
    aws ec2 describe-key-pairs --query "KeyPairs[*].KeyName" --output text

    Write-Output "Criando o par de chaves $keyPairName"
    aws ec2 create-key-pair --key-name $keyPairName --query 'KeyMaterial' --output text > "$keyPairPath\$keyPairName.pem"

    Write-Output "Listando apenas o par de chave $keyPairName"
    aws ec2 describe-key-pairs --query "KeyPairs[?KeyName=='$keyPairName'].KeyName" --output text
}

"-----//-----//-----//-----//-----//-----//-----"
Write-Output "AWS ELASTIC COMPUTE CLOUD (EC2)"
if ((aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" --query "Reservations[].Instances[]").Count -gt 1) {
    Write-Output "Já existe uma instância EC2 com esse nome de tag $tagNameInstance!"
    # aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" --query "Reservations[].Instances[]"
    aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name' && Value=='$tagNameInstance'].Value" --output text

    Write-Output "Listando o IP público de todas as instâncias EC2 criadas"
    aws ec2 describe-instances --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
} else {
    Write-Output "Listando o nome da tag de todas as instâncias EC2 criadas"
    aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text

    Write-Output "Criando a primeira instância EC2 de nome de tag $tagNameInstance"
    $securityGroupId = aws ec2 describe-security-groups --query "SecurityGroups[].GroupId" --output text
    $subnetId = aws ec2 describe-subnets --query "Subnets[?AvailabilityZone=='$availabilityZone'].SubnetId" --output text

    aws ec2 run-instances --image-id $imageId --instance-type t2.micro --key-name $keyPairName --security-group-ids $securityGroupId --subnet-id $subnetId --count 1 --user-data "file://$userDataPath\$userDataFile" --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$tagNameInstance}]" --no-cli-pager

    Write-Output "Listando o nome da tag de todas as instâncias EC2 criadas"
    aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text

    Write-Output "Listando o IP público de todas as instâncias EC2 criadas"
    aws ec2 describe-instances --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
}

Write-Output "No PuTTYgen, gere a chave privada .ppk a partir da chave pública .pem fornecida"
Write-Output "Aguardando 90 segundos"
Start-Sleep -Seconds 90

"-----//-----//-----//-----//-----//-----//-----"
Write-Output "AWS ELASTIC COMPUTE CLOUD (EC2)"
if ((aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp").Count -gt 1) {
    Write-Output "Listando o IP público de todas as instâncias EC2 criadas"
    $ipEc2 = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text

    pscp -i "$keyPairPath\$keyPairName.ppk" -r "$projectPath" ubuntu@ec2-$ipEc2.compute-1.amazonaws.com:/home/ubuntu

} else {
    Write-Output "Não foi fornecido IP público da instância de nome de tag $tagNameInstance"
    aws ec2 describe-instances --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
}