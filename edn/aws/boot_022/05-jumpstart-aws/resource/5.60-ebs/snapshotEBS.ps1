#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EBS"
Write-Output "SNAPSHOT CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$awsAccountId = "001727357081"
$tagNameVolume = "volumeEBSTestEdn1"
$snapshotDescription = "Snapshot Description Test Edn 1"
$tagNameSnapshot = "snapshotEBSTestEdn1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o snapshot de tag de nome $tagNameSnapshot"
    if ((aws ec2 describe-snapshots --owner-ids $awsAccountId --query "Snapshots[].Tags[?Key=='Name' && Value=='$tagNameSnapshot'].Value[]").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe o snapshot de tag de nome $tagNameSnapshot"
        aws ec2 describe-snapshots --owner-ids $awsAccountId --query "Snapshots[].Tags[?Key=='Name' && Value=='$tagNameSnapshot'].Value[]" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os snapshots do EBS criado da conta especificada"
        aws ec2 describe-snapshots --owner-ids $awsAccountId --query "Snapshots[].SnapshotId" --output text
        
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o ID do volume do EBS de tag de nome $tagNameVolume"
        $volumeId = aws ec2 describe-volumes --query "Volumes[?Tags[?Key=='Name' && Value=='$tagNameVolume']].VolumeId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o snapshot de tag de nome $tagNameSnapshot a partir do volume do EBS de tag de nome $tagNameVolume"
        aws ec2 create-snapshot --volume-id $volumeId --description "$snapshotDescription" --tag-specifications "ResourceType=snapshot,Tags=[{Key=Name,Value=$tagNameSnapshot}]" --no-cli-pager

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando apenas o snapshot do EBS de tag de nome $tagNameSnapshot"
        aws ec2 describe-snapshots --owner-ids $awsAccountId --query "Snapshots[].Tags[?Key=='Name' && Value=='$tagNameSnapshot'].Value[]" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EBS"
Write-Output "SNAPSHOT EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$awsAccountId = "001727357081"
$tagNameSnapshot = "snapshotEBSTestEdn1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o snapshot de tag de nome $tagNameSnapshot"
    if ((aws ec2 describe-snapshots --owner-ids $awsAccountId --query "Snapshots[].Tags[?Key=='Name' && Value=='$tagNameSnapshot'].Value[]").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os snapshots do EBS criado da conta especificada"
        aws ec2 describe-snapshots --owner-ids $awsAccountId --query "Snapshots[].SnapshotId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o ID do snapshot do EBS de tag de nome $tagNameSnapshot"
        $snapshotId = aws ec2 describe-snapshots --owner-ids $awsAccountId --query "Snapshots[?Tags[?Key=='Name' && Value=='$tagNameSnapshot']].SnapshotId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo o snapshot do EBS de tag de nome $tagNameSnapshot"
        aws ec2 delete-snapshot --snapshot-id $snapshotId

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os snapshots do EBS criado da conta especificada"
        aws ec2 describe-snapshots --owner-ids $awsAccountId --query "Snapshots[].SnapshotId" --output text
    } else {Write-Output "Não existe o snapshot do EBS de tag de nome $tagNameSnapshot"}
} else {Write-Host "Código não executado"}