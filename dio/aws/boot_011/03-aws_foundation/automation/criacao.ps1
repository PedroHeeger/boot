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

    Write-Output "Criando a instância EC2 de nome de tag $tagNameInstance"
    $securityGroupId = aws ec2 describe-security-groups --query "SecurityGroups[].GroupId" --output text
    $subnetId = aws ec2 describe-subnets --query "Subnets[?AvailabilityZone=='$availabilityZone'].SubnetId" --output text
    aws ec2 run-instances --image-id $imageId --instance-type t2.micro --key-name $keyPairName --security-group-ids $securityGroupId --subnet-id $subnetId --count 1 --user-data "file://$userDataPath\$userDataFile" --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$tagNameInstance}]" --no-cli-pager

    Write-Output "Listando o nome da tag de todas as instâncias EC2 criadas"
    aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text

    Write-Output "Listando o IP público de todas as instâncias EC2 criadas"
    aws ec2 describe-instances --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
}

# Write-Output "No PuTTYgen, gere a chave privada .ppk a partir da chave pública .pem fornecida"
Write-Output "Aguardando 90 segundos para garantir que todos os programas já foram instalados pelo script Bash $userDataFile!"
Start-Sleep -Seconds 90

"-----//-----//-----//-----//-----//-----//-----"
Write-Output "SCP / PSCP (FILE TRANSFER)"
if ((aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp").Count -gt 1) {
    Write-Output "Extraindo o IP público da instância de nome de tag $tagNameInstance"
    $ipEc2 = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
    $ipEc2 = $ipEc2.Replace(".", "-")
    Write-Output $ipEc2

    Write-Output "Transferindo os arquivos para a instância de nome de tag $tagNameInstance"
    scp -i "$keyPairPath\$keyPairName.pem" -o StrictHostKeyChecking=no -r "$projectPath" ubuntu@ec2-$ipEc2.compute-1.amazonaws.com:/home/ubuntu/
    scp -i "$keyPairPath\$keyPairName.pem" -o StrictHostKeyChecking=no -r "$awsCliPath" ubuntu@ec2-$ipEc2.compute-1.amazonaws.com:/home/ubuntu/
    # pscp -batch -i "$keyPairPath\$keyPairName.ppk" -r "$projectPath" ubuntu@ec2-$ipEc2.compute-1.amazonaws.com:/home/ubuntu/
    # pscp -batch -i "$keyPairPath\$keyPairName.ppk" -r "$awsCliPath" ubuntu@ec2-$ipEc2.compute-1.amazonaws.com:/home/ubuntu/
} else {
    Write-Output "Não foi fornecido IP público da instância de nome de tag $tagNameInstance"
    aws ec2 describe-instances --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
}

Write-Output "Aguardando 120 segundos para garantir que todos os arquivos foram enviados!"
Start-Sleep -Seconds 120

"-----//-----//-----//-----//-----//-----//-----"
Write-Output "SSH / PUTTY (REMOTE ACCESS)"
if ((aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp").Count -gt 1) {
    Write-Output "Extraindo o IP público da instância de nome de tag $tagNameInstance"
    $ipEc2 = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
    $ipEc2 = $ipEc2.Replace(".", "-")
    Write-Output $ipEc2

    Write-Output "Movendo os diretórios do Node.js (node_modules, package.json e package-lock.json) para dentro do diretório do projeto"
    ssh -i "$keyPairPath\$keyPairName.pem" ubuntu@ec2-$ipEc2.compute-1.amazonaws.com "sudo mv /home/ubuntu/node_modules /home/ubuntu/projectDioServerless"
    ssh -i "$keyPairPath\$keyPairName.pem" ubuntu@ec2-$ipEc2.compute-1.amazonaws.com "sudo mv /home/ubuntu/package.json /home/ubuntu/projectDioServerless"
    ssh -i "$keyPairPath\$keyPairName.pem" ubuntu@ec2-$ipEc2.compute-1.amazonaws.com "sudo mv /home/ubuntu/package-lock.json /home/ubuntu/projectDioServerless"

    Write-Output "Alterando para diretório do projeto e implantando a infraestrutura com o arquivo serverless"
    ssh -i "$keyPairPath\$keyPairName.pem" "ubuntu@ec2-$ipEc2.compute-1.amazonaws.com" "cd projectDioServerless && serverless deploy"
    # plink -i "$keyPairPath\$keyPairName.ppk" -ssh ubuntu@ec2-$ipEc2.compute-1.amazonaws.com "cd /home/ubuntu/projectDioServerless && serverless deploy"
} else {
    Write-Output "Não foi fornecido IP público da instância de nome de tag $tagNameInstance"
    aws ec2 describe-instances --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
}