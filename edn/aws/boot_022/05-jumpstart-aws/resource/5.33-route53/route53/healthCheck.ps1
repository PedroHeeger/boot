#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON ROUTE 53"
Write-Output "HEALTH CHECK CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$hostedZoneName = "pedroheeger.dev.br."
$healthCheckName = "londres-website-status"
$ipAddress = ""
$portNumber = 80
$typeProtocol = "HTTP"
$resourcePath = "/"
$requestInterval = 30
$failureThreshold = 3
$tagNameInstance = "cafeServer1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe a hosted zone $hostedZoneName"
    if ((aws route53 list-hosted-zones --query "HostedZones[?Name=='$hostedZoneName'].Name").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe a verificação de integridade de nome $healthCheckName"
        if ((aws route53 list-health-checks --query "HealthChecks[?CallerReference=='$healthCheckName'].CallerReference").Count -gt 1) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Já existe a verificação de integridade de nome $healthCheckName"
            aws route53 list-health-checks --query "HealthChecks[?CallerReference=='$healthCheckName'].CallerReference" --output text
        } else {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todas as verificações de integridade criadas"
            aws route53 list-health-checks --query "HealthChecks[].CallerReference" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Extraindo o IP da instância $tagNameInstance"
            $instanceIP = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
            $ipAddress = $instanceIP

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Criando a verificação de integridade de nome $healthCheckName"
            aws route53 create-health-check --caller-reference $healthCheckName --health-check-config "IPAddress=$ipAddress,Port=$portNumber,Type=$typeProtocol,ResourcePath=$resourcePath,RequestInterval=$requestInterval,FailureThreshold=$failureThreshold,EnableSNI=false" --no-cli-pager

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando a verificação de integridade de nome $healthCheckName"
            aws route53 list-health-checks --query "HealthChecks[?CallerReference=='$healthCheckName'].CallerReference" --output text
        }
    } else {Write-Output "Não existe a hosted zone de nome $hostedZoneName"}
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON ROUTE 53"
Write-Output "HEALTH CHECK EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$hostedZoneName = "pedroheeger.dev.br."
$healthCheckName = "healthCheckTest2"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe a hosted zone $hostedZoneName"
    if ((aws route53 list-hosted-zones --query "HostedZones[?Name=='$hostedZoneName'].Name").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe a verificação de integridade de nome $healthCheckName"
        if ((aws route53 list-health-checks --query "HealthChecks[?CallerReference=='$healthCheckName'].CallerReference").Count -gt 1) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todas as verificações de integridade criadas"
            aws route53 list-health-checks --query "HealthChecks[].CallerReference" --output text

            Write-Output "Extraindo o ID da verificação de integridade de nome $healthCheckName"
            $healthCheckId = aws route53 list-health-checks --query "HealthChecks[?CallerReference=='$healthCheckName'].Id" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Removendo a verificação de integridade de nome $healthCheckName"
            aws route53 delete-health-check --health-check-id $healthCheckId

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todas as verificações de integridade criadas"
            aws route53 list-health-checks --query "HealthChecks[].CallerReference" --output text
        } else {Write-Output "Não existe a verificação de integridade de nome $healthCheckName"}    
    } else {Write-Output "Não existe a hosted zone $hostedZoneName"}
} else {Write-Host "Código não executado"}