#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2"
Write-Output "KEY PAIR CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$keyPairName = "keyPairEDNTest1"
$keyPairPath = "G:/Meu Drive/4_PROJ/scripts/scripts_model/power_shell/.default/secrets"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o par de chaves de nome $keyPairName"
    if ((aws ec2 describe-key-pairs --query "KeyPairs[?KeyName=='$keyPairName']").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe o par de chaves de nome $keyPairName"
        aws ec2 describe-key-pairs --query "KeyPairs[?KeyName=='$keyPairName'].KeyName" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os pares de chaves criados"
        aws ec2 describe-key-pairs --query "KeyPairs[].KeyName" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o par de chaves de nome $keyPairName"
        aws ec2 create-key-pair --key-name $keyPairName --query 'KeyMaterial' --output text > "$keyPairPath\$keyPairName.pem"

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando apenas o par de chave de nome $keyPairName"
        aws ec2 describe-key-pairs --query "KeyPairs[?KeyName=='$keyPairName'].KeyName" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2"
Write-Output "KEY PAIR EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$keyPairName = "keyPairEDNTest1"
$keyPairPath = "G:/Meu Drive/4_PROJ/scripts/scripts_model/power_shell/.default/secrets"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o par de chaves de nome $keyPairName"
    if ((aws ec2 describe-key-pairs --query "KeyPairs[?KeyName=='$keyPairName']").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os pares de chaves criados"
        aws ec2 describe-key-pairs --query "KeyPairs[].KeyName" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo o par de chaves de nome $keyPairName e os arquivos pem e ppk"
        aws ec2 delete-key-pair --key-name $keyPairName

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe o arquivo de par de chaves de nome $keyPairName.pem"
        if (Test-Path "$keyPairPath\$keyPairName.pem" -PathType Leaf) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo o arquivo de par de chaves de nome $keyPairName.pem"
            Remove-Item "$keyPairPath\$keyPairName.pem"
        } else {Write-Host "Não existe o arquivo de par de chaves de nome $keyPairName.pem"}

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe o arquivo de par de chaves de nome $keyPairName.ppk"
        if (Test-Path "$keyPairPath\$keyPairName.ppk" -PathType Leaf) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo o arquivo de par de chave de nome $keyPairName.ppk"
            Remove-Item "$keyPairPath\$keyPairName.ppk"
        } else {Write-Host "Não existe o arquivo de par de chave de nome $keyPairName.ppk"}

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os pares de chaves criados"
        aws ec2 describe-key-pairs --query "KeyPairs[].KeyName" --output text
    } else {Write-Output "Não existe o par de chaves de nome $keyPairName"}
} else {Write-Host "Código não executado"}