#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2"
Write-Output "INSTANCE CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$profile = "default"
$region = "us-east-1"
$tagKey = "Name"
$tagValue = "ec2Docker"
$sgName = "default"
$az = "us-east-1a"
$imageId = "ami-0c7217cdde317cfec"    # Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-12-07
$so = "ubuntu"
# $so = "ec2-user"
$instanceType = "t3.medium"      # Ubuntu Price = U$ 0.0451/h -> 7h = U$ 0.3157 -> R$ 5.6 = R$ 1.77
# $instanceType = "t3.large"      # Ubuntu Price = U$ 0.0867/h -> 7h = U$ 0.6069 -> R$ 5.6 = R$ 3.40
$count = 1

$keyPairPath = "G:/Meu Drive/4_PROJ/aws_skb/study_material/aws_scripts_model/.default/secrets/awsKeyPair/universal"
$keyPairName = "keyPairUniversal"
$userDataPath = "G:/Meu Drive/4_PROJ/boot/vnw/cybersecurity/boot_035/environment/aws_dock"
$userDataFile = "udFileDeb.sh"
# $deviceName = "/dev/xvda" 
$deviceName = "/dev/sda1" 
$volumeSize = 40
$volumeType = "gp3"
$iops = 3000
$throughput= 125
# $instanceProfileName = "instanceProfileTest"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe uma instância ativa $tagValue"
    $condition = aws ec2 describe-instances --filters "Name=tag:$tagKey,Values=$tagValue" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text --profile $profile --region $region
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe uma instância ativa $tagValue"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='$tagKey' && Value=='$tagValue'].Value" --output text --profile $profile --region $region

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o IP público da instância ativa $tagValue"
        $instanceIp = aws ec2 describe-instances --filters "Name=tag:$tagKey,Values=$tagValue" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text --profile $profile --region $region
        Write-Output $instanceIp

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id da instância ativa $tagValue"
        $instanceId = aws ec2 describe-instances --filters "Name=tag:$tagKey,Values=$tagValue" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text --profile $profile --region $region

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Exibindo o comando para acesso remoto via SSH ou AWS SSM"
        Write-Output "ssh -i `"$keyPairPath\$keyPairName.pem`" $so@$instanceIp"
        Write-Output "aws ssm start-session --target $instanceId --profile $profile --region $region"
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='$tagKey'].Value" --output text --profile $profile --region $region

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id do SG e da Sub-rede"
        $sgId = aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --output text --profile $profile --region $region
        $subnetId = aws ec2 describe-subnets --query "Subnets[?AvailabilityZone=='$az'].SubnetId" --output text --profile $profile --region $region

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Definindo o par de chaves, o arquivo de user data, uma tag e o perfil de instância"
        if ($keyPairName) {$keyNameParam = @("--key-name", $keyPairName) } else { $keyNameParam = @()}
        if ($userDataPath -and $userDataFile) {$userDataParam = @("--user-data", "file://$userDataPath/$userDataFile")} else { $userDataParam = @() } 
        if ($tagKey -and $tagValue) {$tagParam = @("--tag-specifications", "ResourceType=instance,Tags=[{Key=$tagKey,Value=$tagValue}]")} else {$tagParam = @()}
        if ($instanceProfileName) {$iamProfileParam = @("--iam-instance-profile", "Name=$instanceProfileName")} else {$iamProfileParam = @()}

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Definindo o EBS e sua configuração"
        if ($volumeSize -and $volumeType) {
            $ebsConfig = @{
                VolumeSize = $volumeSize
                VolumeType = $volumeType
            }
            # Adiciona IOPS se o tipo for io1, io2 ou gp3
            if ($volumeType -in @("io1","io2","gp3") -and $iops) { $ebsConfig["Iops"] = $iops }
            # Adiciona Throughput se o tipo for gp3
            if ($volumeType -eq "gp3" -and $throughput) { $ebsConfig["Throughput"] = $throughput }

            # Converte para JSON sem aspas externas adicionais
            $ebsJson = $ebsConfig | ConvertTo-Json -Compress
            # Monta array de argumentos para o block device
            $blockDeviceParam = @("--block-device-mappings", "[{`"DeviceName`":`"$deviceName`",`"Ebs`":$ebsJson}]")
        } else {$blockDeviceParam = @()}
            
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando a instância $tagValue"
        $args = @(
            "ec2", "run-instances",
            "--image-id", $imageId,
            "--instance-type", $instanceType,
            "--security-group-ids", $sgId,
            "--subnet-id", $subnetId,
            "--count", $count,
            "--no-cli-pager",
            "--query", "Instances[0].InstanceId",
            "--output", "text",
            "--profile", $profile,
            "--region", $region
        ) + $keyNameParam + $userDataParam + $blockDeviceParam + $tagParam + $iamProfileParam

        # Executa o comando
        $instanceId = aws @args

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Aguardando a instância criada entrar em execução"
        $instanceState = ""
        while ($instanceState -ne "running") {
            Start-Sleep -Seconds 20  
            $instanceState = aws ec2 describe-instances --instance-ids $instanceId --query "Reservations[].Instances[].State.Name" --output text --no-cli-pager --profile $profile --region $region
            Write-Output "Estado atual da instância: $instanceState"
        }
        
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='$tagKey'].Value" --output text --profile $profile --region $region
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o IP público da instância ativa $tagValue"
        $instanceIp = aws ec2 describe-instances --filters "Name=tag:$tagKey,Values=$tagValue" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text --profile $profile --region $region
        Write-Output $instanceIp

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Exibindo o comando para acesso remoto via SSH ou AWS SSM"
        Write-Output "ssh -i `"$keyPairPath\$keyPairName.pem`" $so@$instanceIp"
        Write-Output "aws ssm start-session --target $instanceId --profile $profile --region $region"
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2"
Write-Output "INSTANCE EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$profile = "default"
$region = "us-east-1"
$tagKey = "Name"
$tagValue = "ec2Docker"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe uma instância ativa $tagValue"
    $condition = aws ec2 describe-instances --filters "Name=tag:$tagKey,Values=$tagValue" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text --profile $profile --region $region
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='$tagKey'].Value" --output text --profile $profile --region $region
        
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id da instância $tagValue"
        $instanceId = aws ec2 describe-instances --filters "Name=tag:$tagKey,Values=$tagValue" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text --profile $profile --region $region

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo a instância $tagValue"
        aws ec2 terminate-instances --instance-ids $instanceId --no-dry-run --no-cli-pager --profile $profile --region $region

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Aguardando a instância ser removida"
        $instanceState = ""
        while ($instanceState -ne "terminated") {
            Start-Sleep -Seconds 20  
            $instanceState = aws ec2 describe-instances --instance-ids $instanceId --query "Reservations[].Instances[].State.Name" --output text --no-cli-pager --profile $profile --region $region
            Write-Output "Estado atual da instância: $instanceState"
        }
        
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='$tagKey'].Value" --output text --profile $profile --region $region
    } else {Write-Output "Não existe uma instância ativa $tagValue"}
} else {Write-Host "Código não executado"}




Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Removendo as variáveis"
Remove-Variable profile,region,tagKey,tagValue,sgName,az,imageId,so,instanceType,count,keyPairPath,keyPairName,userDataPath,userDataFile,deviceName,volumeSize,volumeType,iops,throughput,instanceProfileName,sgId,subnetId,instanceIp,instanceId,keyNameParam,userDataParam,tagParam,iamProfileParam,blockDeviceParam -ErrorAction SilentlyContinue