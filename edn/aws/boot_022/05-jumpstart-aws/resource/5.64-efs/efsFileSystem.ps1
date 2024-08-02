#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EFS"
Write-Output "FILE SYSTEM CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$efsToken = "fsTokenEFSEdn1"
$tagNameFS = "fsEFSEdn1"
$performanceMode = "generalPurpose"
$throughputMode = "bursting"
$aZ = "us-east-1a"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o sistema de arquivos de tag de nome $tagNameFS"
    if ((aws efs describe-file-systems --query "FileSystems[].Tags[?Key=='Name' && Value=='$tagNameFS'].Value[]").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe o sistema de arquivos de tag de nome $tagNameFS"
        aws efs describe-file-systems --query "FileSystems[].Tags[?Key=='Name' && Value=='$tagNameFS'].Value[]" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando a tag de nome de todos os sistemas de arquivos"
        aws efs describe-file-systems --query "FileSystems[].Tags[?Key=='Name'].Value" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o sistema de arquivos de tag de nome $tagNameFS"
        aws efs create-file-system --creation-token $efsToken --performance-mode $performanceMode --throughput-mode $throughputMode --tags "Key=Name,Value=$tagNameFS" --no-cli-pager

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando apenas o sistema de arquivos de tag de nome $tagNameFS"
        aws efs describe-file-systems --query "FileSystems[].Tags[?Key=='Name' && Value=='$tagNameFS'].Value[]" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EFS"
Write-Output "FILE SYSTEM EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$tagNameFS = "fsEFSEdn1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o sistema de arquivos de tag de nome $tagNameFS"
    if ((aws efs describe-file-systems --query "FileSystems[].Tags[?Key=='Name' && Value=='$tagNameFS'].Value[]").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando a tag de nome de todos os sistemas de arquivos"
        aws efs describe-file-systems --query "FileSystems[].Tags[?Key=='Name'].Value" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o ID do sistema de arquivos de tag de nome $tagNameFS"
        $fsId = aws efs describe-file-systems --query "FileSystems[?Tags[?Key=='Name' && Value=='$tagNameFS']].FileSystemId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existem pontos de montagem no sistema de arquivos de tag de nome $tagNameFS"
        $mountTargetIds = (aws efs describe-mount-targets --file-system-id $fsId --query "MountTargets[].MountTargetId[]" --output text) -split '\s+'

        if ($mountTargetIds) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Removendo todos os pontos de montagem no sistema de arquivos de tag de nome $tagNameFS"
            foreach ($mountTargetId in $mountTargetIds) {
                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Removendo ponto de montagem $mountTargetId"
                aws efs delete-mount-target --mount-target-id $mountTargetId

                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Aguardando a remoção do ponto de montagem $mountTargetId"
                $state = "deleting"
                while ($state -eq "creating" -or $state -eq "available" -or $state -eq "deleting") {Start-Sleep -Seconds 5; $state = (aws efs describe-mount-targets --file-system-id $fsId --query "MountTargets[?MountTargetId=='$mountTargetId'].LifeCycleState[]" --output text); Write-Output "Current state: $state"}
            }
        } else {Write-Host "Não existem pontos de montagem no sistema de arquivos de tag de nome $tagNameFS"}

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo o sistema de arquivos de tag de nome $tagNameFS"
        aws efs delete-file-system --file-system-id $fsId

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando a tag de nome de todos os sistemas de arquivos"
        aws efs describe-file-systems --query "FileSystems[].Tags[?Key=='Name'].Value" --output text
    } else {Write-Output "Não existe o sistema de arquivos de tag de nome $tagNameFS"}
} else {Write-Host "Código não executado"}