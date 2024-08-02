#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EBS"
Write-Output "VOLUME CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$size = 10
# $size = 15
$aZ = "us-east-1a"
$volumeType = "gp2"
$tagNameVolume = "volumeEBSTestEdn1"
# $tagNameVolume = "volumeEBSTestEdn2"
$awsAccountId = "001727357081"
$tagNameSnapshot = "snapshotEBSTestEdn1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o volume do EBS de tag de nome $tagNameVolume"
    if ((aws ec2 describe-volumes --query "Volumes[].Tags[?Key=='Name' && Value=='$tagNameVolume'].Value[]").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe o volume do EBS de tag de nome $tagNameVolume"
        aws ec2 describe-volumes --query "Volumes[].Tags[?Key=='Name' && Value=='$tagNameVolume'].Value[]" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os volumes do EBS criado"
        aws ec2 describe-volumes --query "Volumes[].VolumeId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando um volume do EBS de tag de nome $tagNameVolume"
        aws ec2 create-volume --size $size --availability-zone $aZ --volume-type $volumeType --tag-specifications "ResourceType=volume,Tags=[{Key=Name,Value=$tagNameVolume}]" --no-cli-pager

        # Write-Output "-----//-----//-----//-----//-----//-----//-----"
        # Write-Output "Extraindo o ID do snapshot do EBS de tag de nome $tagNameSnapshot"
        # $snapshotId = aws ec2 describe-snapshots --owner-ids $awsAccountId --query "Snapshots[?Tags[?Key=='Name' && Value=='$tagNameSnapshot']].SnapshotId" --output text

        # Write-Output "-----//-----//-----//-----//-----//-----//-----"
        # Write-Output "Criando um volume do EBS de tag de nome $tagNameVolume a partir do snapshot de tag de nome $tagNameSnapshot"
        # aws ec2 create-volume --snapshot-id $snapshotId --size $size --availability-zone $aZ --volume-type $volumeType --tag-specifications "ResourceType=volume,Tags=[{Key=Name,Value=$tagNameVolume}]" --no-cli-pager

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando apenas o volume do EBS de tag de nome $tagNameVolume"
        aws ec2 describe-volumes --query "Volumes[].Tags[?Key=='Name' && Value=='$tagNameVolume'].Value[]" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EBS"
Write-Output "VOLUME EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$tagNameVolume = "volumeEBSTestEdn1"
# $tagNameVolume = "volumeEBSTestEdn2"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o volume do EBS de tag de nome $tagNameVolume"
    if ((aws ec2 describe-volumes --query "Volumes[].Tags[?Key=='Name' && Value=='$tagNameVolume'].Value[]").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os volumes do EBS criado"
        aws ec2 describe-volumes --query "Volumes[].VolumeId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o ID do volume do EBS de tag de nome $tagNameVolume"
        $volumeId = aws ec2 describe-volumes --query "Volumes[?Tags[?Key=='Name' && Value=='$tagNameVolume']].VolumeId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe instâncias anexadas ao volume do EBS de tag de nome $tagNameVolume"
        if ((aws ec2 describe-volumes --query "Volumes[?Tags[?Key=='Name' && Value=='$tagNameVolume']].Attachments[]").Count -gt 1) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Desanexando o volume do EBS de tag de nome $tagNameVolume da instância"
            aws ec2 detach-volume --volume-id $volumeId
        } else {Write-Host "Não existe instâncias anexadas ao volume do EBS de tag de nome $tagNameVolume"}

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Aguardando o volume do EBS de tag de nome $tagNameVolume ficar disponivel"
        $state = ""
        while ($state -ne "available") {Start-Sleep -Seconds 5; $state = (aws ec2 describe-volumes --volume-ids $volumeId --query "Volumes[0].State" --output text); Write-Output "Current state: $state"}

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo o volume do EBS de tag de nome $tagNameVolume"
        aws ec2 delete-volume --volume-id $volumeId

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os volumes do EBS criado"
        aws ec2 describe-volumes --query "Volumes[].VolumeId" --output text
    } else {Write-Output "Não existe o volume do EBS de tag de nome $tagNameVolume"}
} else {Write-Host "Código não executado"}