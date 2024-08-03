#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2"
Write-Output "LAUNCH TEMPLATE CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$launchTempName = "launchTempEdn1"
$versionDescription = "My version 1"
$amiId = "ami-0c7217cdde317cfec"    # Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-12-07
$instanceType = "t2.micro"
$keyPair = "keyPairUniversal"
$userDataPath = "G:/Meu Drive/4_PROJ/scripts/scripts_model/.default/aws/ec2_userData/httpd_stress"
$userDataFile = "udFile.sh"
$sgName = "default"
$instanceProfileName = "instanceProfileEdn1"
$deviceName = "/dev/xvda"
$volumeSize = 8
$volumeType = "gp2"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o modelo de implantação de nome $launchTempName"
    if ((aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].LaunchTemplateName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe o modelo de implantação de nome $launchTempName"
        aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].LaunchTemplateName" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        $resposta = Read-Host "Quer implementar uma nova versão? (y/n) "
        if ($resposta.ToLower() -eq 'y') {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Extraindo a última versão do modelo de implantação de nome $launchTempName"
            $latestVersion = aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].LatestVersionNumber" --output text
            $versionNumber = [int]$latestVersion + 1

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todas as versões do modelo de implantação de nome $launchTempName"
            aws ec2 describe-launch-template-versions --launch-template-name $launchTempName --query "LaunchTemplateVersions[].[LaunchTemplateName,VersionNumber]" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Extraindo o ID do security group"
            $sgId = aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Extraindo a ARN do instance profile"
            $instanceProfileArn = aws iam list-instance-profiles --query "InstanceProfiles[?InstanceProfileName=='$instanceProfileName'].Arn" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Codificando o arquivo user data em Base64"
            $udFileBase64 = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes((Get-Content -Raw -Path "$userDataPath/$userDataFile")))

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Criando o launch template (modelo de implantação) de nome $launchTempName na versão $versionNumber"
            aws ec2 create-launch-template-version --launch-template-name $launchTempName --version-description $versionDescription --launch-template-data "{
                `"ImageId`": `"$amiId`",
                `"InstanceType`": `"$instanceType`",
                `"KeyName`": `"$keyPair`",
                `"UserData`": `"$udFileBase64`",
                `"SecurityGroupIds`": `"$sgId`",
                `"IamInstanceProfile`": {
                    `"Arn`": `"$instanceProfileArn`"
                },
                `"BlockDeviceMappings`": [
                {
                    `"DeviceName`": `"$deviceName`",
                    `"Ebs`": {
                    `"VolumeSize`": $volumeSize,
                    `"VolumeType`": `"$volumeType`"
                    }
                }
                ]
            }" --no-cli-pager

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando o modelo de implantação de nome $launchTempName na versão $versionNumber"
            aws ec2 describe-launch-template-versions --launch-template-name $launchTempName --query "LaunchTemplateVersions[?to_string(VersionNumber)=='$versionNumber'].[LaunchTemplateName,VersionNumber]" --output text
        }
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Definindo a versão como primeira do modelo de implantação de nome $launchTempName"
        $versionNumber = 1

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os modelos de implantação existentes"
        aws ec2 describe-launch-templates --query 'LaunchTemplates[].[LaunchTemplateName,DefaultVersionNumber]' --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o ID do security group"
        $sgId = aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo a ARN do instance profile"
        $instanceProfileArn = aws iam list-instance-profiles --query "InstanceProfiles[?InstanceProfileName=='$instanceProfileName'].Arn" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Codificando o arquivo user data em Base64"
        $udFileBase64 = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes((Get-Content -Raw -Path "$userDataPath/$userDataFile")))
 
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o launch template (modelo de implantação) de nome $launchTempName na versão $versionNumber"
        aws ec2 create-launch-template --launch-template-name $launchTempName --version-description $versionDescription --launch-template-data "{
            `"ImageId`": `"$amiId`",
            `"InstanceType`": `"$instanceType`",
            `"KeyName`": `"$keyPair`",
            `"UserData`": `"$udFileBase64`",
            `"SecurityGroupIds`": [`"$sgId`"],
            `"IamInstanceProfile`": {
                `"Arn`": `"$instanceProfileArn`"
            },
            `"BlockDeviceMappings`": [
                {
                `"DeviceName`": `"$deviceName`",
                `"Ebs`": {
                    `"VolumeSize`": $volumeSize,
                    `"VolumeType`": `"$volumeType`"
                }
                }
            ]
            }" --no-cli-pager

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o modelo de implantação de nome $launchTempName na versão $versionNumber"
        aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].[LaunchTemplateName,DefaultVersionNumber]" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2"
Write-Output "LAUNCH TEMPLATE EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$launchTempName = "launchTempEdn1"
$versionNumber = 1

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o modelo de implantação de nome $launchTempName"
    if ((aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].LaunchTemplateName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os modelos de implantação existentes e sua versão padrão"
        aws ec2 describe-launch-templates --query 'LaunchTemplates[].[LaunchTemplateName,DefaultVersionNumber]' --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe o modelo de implantação de nome $launchTempName na versão $versionNumber"
        if ((aws ec2 describe-launch-template-versions --launch-template-name $launchTempName --query "LaunchTemplateVersions[?to_string(VersionNumber)=='$versionNumber'].VersionNumber").Count -gt 1) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todas as versões do modelo de implantação de nome $launchTempName"
            aws ec2 describe-launch-template-versions --launch-template-name $launchTempName --query "LaunchTemplateVersions[].[LaunchTemplateName,VersionNumber]" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Extraindo a versão padrão do modelo de implantação de nome $launchTempName"
            $defaultVersion = aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].DefaultVersionNumber" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Verificando se a versão escolhida é a versão padrão do modelo de implantação de nome $launchTempName"
            if ($versionNumber -eq $defaultVersion) {
                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Removendo o modelo de implantação de nome $launchTempName por completo"
                aws ec2 delete-launch-template --launch-template-name $launchTempName

                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Listando todos os modelos de implantação existentes"
                aws ec2 describe-launch-templates --query 'LaunchTemplates[].[LaunchTemplateName,DefaultVersionNumber]' --output text
            } else {
                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Removendo o modelo de implantação de nome $launchTempName na versão $versionNumber"
                aws ec2 delete-launch-template-versions --launch-template-name $launchTempName --versions $versionNumber

                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Listando todas as versões do modelo de implantação de nome $launchTempName"
                aws ec2 describe-launch-template-versions --launch-template-name $launchTempName --query "LaunchTemplateVersions[].[LaunchTemplateName,VersionNumber]" --output text
            }
        } else {Write-Output "Não existe o modelo de implantação de nome $launchTempName na versão $versionNumber"}
    } else {Write-Output "Não existe o modelo de implantação de nome $launchTempName"}
} else {Write-Host "Código não executado"}