#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EFS"
Write-Output "MOUNT TARGET CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$tagNameFS = "fsEFSEdn1"
$sgName = "default"
$aZ = "us-east-1a"
# $aZ = "us-east-1b"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o sistema de arquivos de tag de nome $tagNameFS"
    if ((aws efs describe-file-systems --query "FileSystems[].Tags[?Key=='Name' && Value=='$tagNameFS'].Value[]").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o ID do sistema de arquivos de tag de nome $tagNameFS"
        $fsId = aws efs describe-file-systems --query "FileSystems[?Tags[?Key=='Name' && Value=='$tagNameFS']].FileSystemId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id dos elementos de rede"
        $sgId = aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --output text
        $subnetId = aws ec2 describe-subnets --query "Subnets[?AvailabilityZone=='$aZ'].SubnetId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe um ponto de montagem no sistema de arquivos de tag de nome $tagNameFS na AZ $aZ"
        if ((aws efs describe-mount-targets --file-system-id $fsId --query "MountTargets[?AvailabilityZoneName=='$aZ'].MountTargetId[]").Count -gt 1) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Já existe um ponto de montagem no sistema de arquivos de tag de nome $tagNameFS na AZ $aZ"
            aws efs describe-mount-targets --file-system-id $fsId --query "MountTargets[?AvailabilityZoneName=='$aZ'].MountTargetId[]" --output text
        } else {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todos os pontos de montagem existentes no sistema de arquivo de tag de nome $tagNameFS"
            aws efs describe-mount-targets --file-system-id $fsId --query "MountTargets[].MountTargetId[]" --output text
   
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Criando um ponto de montagem no sistema de arquivos de tag de nome $tagNameFS na AZ $aZ"
            aws efs create-mount-target --file-system-id $fsId --subnet-id $subnetId --security-groups $sgId --no-cli-pager

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Aguardando o ponto de montagem no sistema de arquivos de tag de nome $tagNameFS na AZ $aZ ficar disponivel"
            $state = ""
            while ($state -ne "available") {Start-Sleep -Seconds 8; $state = (aws efs describe-mount-targets --file-system-id $fsId --query "MountTargets[?AvailabilityZoneName=='$aZ'].LifeCycleState[]" --output text); Write-Output "Current state: $state"}

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando apenas o ponto de montagem no sistema de arquivos de tag de nome $tagNameFS na AZ $aZ"
            aws efs describe-mount-targets --file-system-id $fsId --query "MountTargets[?AvailabilityZoneName=='$aZ'].MountTargetId[]" --output text
        }
    } else {Write-Output "Não existe o sistema de arquivos de tag de nome $tagNameFS"}    
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EFS"
Write-Output "MOUNT TARGET EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$tagNameFS = "fsEFSEdn1"
$sgName = "default"
$aZ = "us-east-1a"
# $aZ = "us-east-1b"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o sistema de arquivos de tag de nome $tagNameFS"
    if ((aws efs describe-file-systems --query "FileSystems[].Tags[?Key=='Name' && Value=='$tagNameFS'].Value[]").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o ID do sistema de arquivos de tag de nome $tagNameFS"
        $fsId = aws efs describe-file-systems --query "FileSystems[?Tags[?Key=='Name' && Value=='$tagNameFS']].FileSystemId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id dos elementos de rede"
        $sgId = aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --output text
        $subnetId = aws ec2 describe-subnets --query "Subnets[?AvailabilityZone=='$aZ'].SubnetId" --output text
        
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe um ponto de montagem no sistema de arquivos de tag de nome $tagNameFS na AZ $aZ"
        if ((aws efs describe-mount-targets --file-system-id $fsId --query "MountTargets[?AvailabilityZoneName=='$aZ'].MountTargetId[]").Count -gt 1) {     
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todos os pontos de montagem existentes no sistema de arquivo de tag de nome $tagNameFS"
            aws efs describe-mount-targets --file-system-id $fsId --query "MountTargets[].MountTargetId[]" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Extraindo o ID do ponto de montagem do sistema de arquivos de tag de nome $tagNameFS na AZ $aZ"
            $mountTargetId = aws efs describe-mount-targets --file-system-id $fsId --query "MountTargets[?AvailabilityZoneName=='$aZ'].MountTargetId[]" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Removendo o ponto de montagem do sistema de arquivos de tag de nome $tagNameFS na AZ $aZ"
            aws efs delete-mount-target --mount-target-id $mountTargetId

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Aguardando o ponto de montagem no sistema de arquivos de tag de nome $tagNameFS na AZ $aZ ser deletado"
            $state = "deleting"
            while ($state -eq "creating" -or $state -eq "available" -or $state -eq "deleting") {Start-Sleep -Seconds 5; $state = (aws efs describe-mount-targets --file-system-id $fsId --query "MountTargets[?AvailabilityZoneName=='$aZ'].LifeCycleState[]" --output text); Write-Output "Current state: $state"}

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todos os pontos de montagem existentes no sistema de arquivo de tag de nome $tagNameFS"
            aws efs describe-mount-targets --file-system-id $fsId --query "MountTargets[].MountTargetId[]" --output text
        } else {Write-Output "Não existe nenhum ponto de montagem no sistema de arquivos de tag de nome $tagNameFS na AZ $aZ"}
    } else {Write-Output "Não existe o sistema de arquivos de tag de nome $tagNameFS"}
} else {Write-Host "Código não executado"}