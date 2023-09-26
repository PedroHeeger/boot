Write-Output "Importando o arquivo com as variáveis"
. "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\variaveis.ps1"

"-----//-----//-----//-----//-----//-----//-----"
Write-Output "SERVIÇO: AWS EC2"
"-----//-----//-----//-----//-----//-----//-----"
Write-Output "KEY PAIR"
if ((aws ec2 describe-key-pairs --query "KeyPairs[?KeyName=='$key_pair_name']").Count -gt 1) {
    Write-Output "Removendo o par de chaves criado de nome $key_pair_name e os arquivos pem e ppk"
    aws ec2 delete-key-pair --key-name $key_pair_name

    if (Test-Path "$key_pair_path\$key_pair_name.pem" -PathType Leaf) {
        Write-Host "Removendo o arquivo de par de chave $key_pair_name.pem"
        Remove-Item "$key_pair_path\$key_pair_name.pem"
    } else {
        Write-Host "Não existe o arquivo de par de chave $key_pair_name.pem"
    }
    if (Test-Path "$key_pair_path\$key_pair_name.ppk" -PathType Leaf) {
        Write-Host "Removendo o arquivo de par de chave $key_pair_name.ppk"
        Remove-Item "$key_pair_path\$key_pair_name.ppk"
    } else {
        Write-Host "Não existe o arquivo de par de chave $key_pair_name.ppk"
    }
} else {
    Write-Output "Não existe o par de chaves de $key_pair_name!"
}

"-----//-----//-----//-----//-----//-----//-----"
Write-Output "AWS ELASTIC COMPUTE CLOUD (EC2)"
if ((aws ec2 describe-instances --filters "Name=tag:Name,Values=$tag_name_instance" --query "Reservations[].Instances[]").Count -gt 1) {
    Write-Output "Removendo a instância criada de nome de tag $tag_name_instance"
    $instance_id1 = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tag_name_instance" --query "Reservations[].Instances[].InstanceId" --output text
    aws ec2 terminate-instances --instance-ids $instance_id1 --no-dry-run
} else {
    Write-Output "Não existe instâncias com o nome de tag $tag_name_instance!"
}