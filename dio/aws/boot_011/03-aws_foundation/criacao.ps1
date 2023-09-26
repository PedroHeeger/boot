Write-Output "Importando o arquivo com as variáveis"
. "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\variaveis.ps1"

"-----//-----//-----//-----//-----//-----//-----"
Write-Output "SERVIÇO: AWS EC2"
"-----//-----//-----//-----//-----//-----//-----"
Write-Output "KEY PAIR"
if ((aws ec2 describe-key-pairs --query "KeyPairs[?KeyName=='$key_pair_name']").Count -gt 1) {
    Write-Output "O par de chaves $key_pair_name já foi criado!"
    aws ec2 describe-key-pairs --query "KeyPairs[?KeyName=='$key_pair_name'].KeyName" --output text
} else {
    Write-Output "Listando todos os pares de chaves criados"
    aws ec2 describe-key-pairs --query "KeyPairs[*].KeyName" --output text

    Write-Output "Criando o par de chaves $key_pair_name"
    # $key_pair_name = "remoteAccessEc2"
    # $key_pair_path = "G:\Meu Drive\4_PROJ\course\cloud_treinamentos\aws\curso_080\secrets"
    aws ec2 create-key-pair --key-name $key_pair_name --query 'KeyMaterial' --output text > "$key_pair_path\$key_pair_name.pem"

    Write-Output "Listando apenas o par de chave $key_pair_name"
    aws ec2 describe-key-pairs --query "KeyPairs[?KeyName=='$key_pair_name'].KeyName" --output text
}

"-----//-----//-----//-----//-----//-----//-----"
Write-Output "AWS ELASTIC COMPUTE CLOUD (EC2)"
if ((aws ec2 describe-instances --filters "Name=tag:Name,Values=$tag_name_instance" --query "Reservations[].Instances[]").Count -gt 1) {
    Write-Output "Já existe uma instância EC2 com esse nome de tag $tag_name_instance!"
    # aws ec2 describe-instances --filters "Name=tag:Name,Values=$tag_name_instance" --query "Reservations[].Instances[]"
    aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name' && Value=='$tag_name_instance'].Value" --output text

    Write-Output "Listando o IP público de todas as instâncias EC2 criadas"
    aws ec2 describe-instances --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
} else {
    Write-Output "Listando o nome da tag de todas as instâncias EC2 criadas"
    aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text

    Write-Output "Criando a primeira instância EC2 de nome de tag $tag_name_instance"
    $security_group_id = aws ec2 describe-security-groups --query "SecurityGroups[].GroupId" --output text
    $subnet_id = aws ec2 describe-subnets --query "Subnets[?AvailabilityZone=='$availability_zone'].SubnetId" --output text

    aws ec2 run-instances --image-id $image_id --instance-type t2.micro --key-name $key_pair_name --security-group-ids $security_group_id --subnet-id $subnet_id --count 1 --iam-instance-profile Name=$instance_profile_name --user-data "file://$user_data_path\$user_data_file" --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$tag_name_instance}]" --no-cli-pager

    Write-Output "Listando o nome da tag de todas as instâncias EC2 criadas"
    aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text

    Write-Output "Listando o IP público de todas as instâncias EC2 criadas"
    aws ec2 describe-instances --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
}