Write-Output "Importando o arquivo com as variáveis"
. "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\automation\variaveis.ps1"

"-----//-----//-----//-----//-----//-----//-----"
Write-Output "SERVIÇO: AWS EC2"
"-----//-----//-----//-----//-----//-----//-----"
Write-Output "KEY PAIR"
if ((aws ec2 describe-key-pairs --query "KeyPairs[?KeyName=='$keyPairName']").Count -gt 1) {
    Write-Output "Removendo o par de chaves criado de nome $keyPairName e os arquivos pem e ppk"
    aws ec2 delete-key-pair --key-name $keyPairName

    if (Test-Path "$keyPairPath\$keyPairName.pem" -PathType Leaf) {
        Write-Host "Removendo o arquivo de par de chave $keyPairName.pem"
        Remove-Item "$keyPairPath\$keyPairName.pem"
    } else {
        Write-Host "Não existe o arquivo de par de chave $keyPairName.pem"
    }
    if (Test-Path "$keyPairPath\$keyPairName.ppk" -PathType Leaf) {
        Write-Host "Removendo o arquivo de par de chave $keyPairName.ppk"
        Remove-Item "$keyPairPath\$keyPairName.ppk"
    } else {
        Write-Host "Não existe o arquivo de par de chave $keyPairName.ppk"
    }
} else {
    Write-Output "Não existe o par de chaves de $keyPairName!"
}

"-----//-----//-----//-----//-----//-----//-----"
Write-Output "AWS ELASTIC COMPUTE CLOUD (EC2)"
if ((aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" --query "Reservations[].Instances[]").Count -gt 1) {
    Write-Output "Removendo a instância criada de nome de tag $tagNameInstance"
    $instanceId1 = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" --query "Reservations[].Instances[].InstanceId" --output text
    aws ec2 terminate-instances --instance-ids $instanceId1 --no-dry-run --no-cli-pager
} else {
    Write-Output "Não existe instâncias com o nome de tag $tagNameInstance!"
}