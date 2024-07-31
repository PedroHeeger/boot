#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON ROUTE 53"
Write-Output "RECORD FAILOVER-HOSTED ZONE CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
# $hostedZoneName = "hosted-zone-test1.com.br."
# $domainName = "hosted-zone-test1.com.br"
$hostedZoneName = "pedroheeger.dev.br."
$domainName = "pedroheeger.dev.br"
$resourceRecordName = "www.pedroheeger.dev.br"
$resourceRecordType = "A"
$ttl = 15
$tagNameInstance1 = "cafeServer1"
$tagNameInstance2 = "cafeServer2"
$failoverRecordType1 = "PRIMARY"   # PRIMARY OR SECONDARY
$failoverRecordType2 = "SECONDARY"   # PRIMARY OR SECONDARY
$healthCheckName = "londres-website-status"
$recordId1 = "Primary"
$recordId2 = "Secondary"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe a hosted zone $hostedZoneName"
    if ((aws route53 list-hosted-zones --query "HostedZones[?Name=='$hostedZoneName'].Name").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id da hosted zone $hostedZoneName"
        $hostedZoneId = aws route53 list-hosted-zones --query "HostedZones[?Name=='$hostedZoneName'].Id" --output text

        # PRIMARY INSTANCE
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe o registro de nome $resourceRecordName com identificador $recordId1 na hosted zone $hostedZoneName"
        if ((aws route53 list-resource-record-sets --hosted-zone-id $hostedZoneId --query "ResourceRecordSets[?Name=='$resourceRecordName.' && SetIdentifier=='$recordId1'].Name").Count -gt 1) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Já existe o registro de nome $resourceRecordName com identificador $recordId1 na hosted zone $hostedZoneName"
            aws route53 list-resource-record-sets --hosted-zone-id $hostedZoneId --query "ResourceRecordSets[?Name=='$resourceRecordName.' && SetIdentifier=='$recordId1'].SetIdentifier" --output text
        } else {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todos os registros de nome $resourceRecordName na hosted zone $hostedZoneName"
            aws route53 list-resource-record-sets --hosted-zone-id $hostedZoneId --query "ResourceRecordSets[?Name=='$resourceRecordName.'].SetIdentifier" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Extraindo o IP da instância $tagNameInstance1"
            $instanceIP1 = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance1" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text

            Write-Output "Extraindo o ID da verificação de integridade de nome $healthCheckName"
            $healthCheckId = aws route53 list-health-checks --query "HealthChecks[?CallerReference=='$healthCheckName'].Id" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Criando o registro de nome $resourceRecordName com identificador $recordId1 na hosted zone $hostedZoneName"
            aws route53 change-resource-record-sets --hosted-zone-id $hostedZoneId --change-batch "{
                `"Changes`": [
                {
                    `"Action`": `"CREATE`",
                    `"ResourceRecordSet`": {
                    `"Name`": `"${resourceRecordName}`",
                    `"Type`": `"${resourceRecordType}`",
                    `"TTL`": ${ttl},
                    `"ResourceRecords`": [
                        {`"Value`": `"${instanceIP1}`"}
                    ],
                    `"SetIdentifier`": `"${recordId1}`",
                    `"Failover`": `"${failoverRecordType1}`",
                    `"HealthCheckId`": `"${healthCheckId}`"
                    }
                }
                ]
            }"
    
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando o registro de nome $resourceRecordName com identificador $recordId1 na hosted zone $hostedZoneName"
            aws route53 list-resource-record-sets --hosted-zone-id $hostedZoneId --query "ResourceRecordSets[?Name=='$resourceRecordName.' && SetIdentifier=='$recordId1'].SetIdentifier" --output text
        }

        # SECONDARY INSTANCE
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe o registro de nome $resourceRecordName com identificador $recordId2 na hosted zone $hostedZoneName"
        if ((aws route53 list-resource-record-sets --hosted-zone-id $hostedZoneId --query "ResourceRecordSets[?Name=='$resourceRecordName.' && SetIdentifier=='$recordId2'].Name").Count -gt 1) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Já existe o registro de nome $resourceRecordName com identificador $recordId2 na hosted zone $hostedZoneName"
            aws route53 list-resource-record-sets --hosted-zone-id $hostedZoneId --query "ResourceRecordSets[?Name=='$resourceRecordName.' && SetIdentifier=='$recordId2'].SetIdentifier" --output text
        } else {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todos os registros de nome $resourceRecordName na hosted zone $hostedZoneName"
            aws route53 list-resource-record-sets --hosted-zone-id $hostedZoneId --query "ResourceRecordSets[?Name=='$resourceRecordName.'].SetIdentifier" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Extraindo o IP da instância $tagNameInstance2"
            $instanceIP2 = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance2" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Criando o registro de nome $resourceRecordName com identificador $recordId2 na hosted zone $hostedZoneName"
            aws route53 change-resource-record-sets --hosted-zone-id $hostedZoneId --change-batch "{
                `"Changes`": [
                {
                    `"Action`": `"CREATE`",
                    `"ResourceRecordSet`": {
                    `"Name`": `"${resourceRecordName}`",
                    `"Type`": `"${resourceRecordType}`",
                    `"TTL`": ${ttl},
                    `"ResourceRecords`": [
                        {`"Value`": `"${instanceIP2}`"}
                    ],
                    `"SetIdentifier`": `"${recordId2}`",
                    `"Failover`": `"${failoverRecordType2}`"
                    }
                }
                ]
            }"
    
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando o registro de nome $resourceRecordName com identificador $recordId2 na hosted zone $hostedZoneName"
            aws route53 list-resource-record-sets --hosted-zone-id $hostedZoneId --query "ResourceRecordSets[?Name=='$resourceRecordName.' && SetIdentifier=='$recordId2'].SetIdentifier" --output text
        }
    } else {Write-Output "Não existe a hosted zone de nome $hostedZoneName"}
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON ROUTE 53"
Write-Output "RECORD FAILOVER-HOSTED ZONE EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
# $hostedZoneName = "hosted-zone-test1.com.br."
# $domainName = "hosted-zone-test1.com.br"
$hostedZoneName = "pedroheeger.dev.br."
$domainName = "pedroheeger.dev.br"
$resourceRecordName = "www.pedroheeger.dev.br"
$resourceRecordType = "A"
$ttl = 15
$tagNameInstance1 = "cafeServer1"
$tagNameInstance2 = "cafeServer2"
$failoverRecordType1 = "PRIMARY"   # PRIMARY OR SECONDARY
$failoverRecordType2 = "SECONDARY"   # PRIMARY OR SECONDARY
$healthCheckName = "londres-website-status"
$recordId1 = "Primary"
$recordId2 = "Secondary"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe a hosted zone $hostedZoneName"
    if ((aws route53 list-hosted-zones --query "HostedZones[?Name=='$hostedZoneName'].Name").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id da hosted zone $hostedZoneName"
        $hostedZoneId = aws route53 list-hosted-zones --query "HostedZones[?Name=='$hostedZoneName'].Id" --output text

        # PRIMARY
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe o registro de nome $resourceRecordName com identificador $recordId1 na hosted zone $hostedZoneName"
        if ((aws route53 list-resource-record-sets --hosted-zone-id $hostedZoneId --query "ResourceRecordSets[?Name=='$resourceRecordName.' && SetIdentifier=='$recordId1'].Name").Count -gt 1) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todos os registros de nome $resourceRecordName na hosted zone $hostedZoneName"
            aws route53 list-resource-record-sets --hosted-zone-id $hostedZoneId --query "ResourceRecordSets[?Name=='$resourceRecordName.'].SetIdentifier" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Extraindo o IP da instância $tagNameInstance1"
            $instanceIP1 = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance1" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Verificando se o IP está vazio, caso esteja extraindo o IP da instância $tagNameInstance1 configurado no registro de nome $resourceRecordName"
            if (-not $instanceIP1) {$instanceIP1 = aws route53 list-resource-record-sets --hosted-zone-id $hostedZoneId --query "ResourceRecordSets[?Name=='${resourceRecordName}.' && SetIdentifier=='$recordId1'].ResourceRecords[].Value" --output text}

            Write-Output "Extraindo o ID da verificação de integridade de nome $healthCheckName"
            $healthCheckId = aws route53 list-health-checks --query "HealthChecks[?CallerReference=='$healthCheckName'].Id" --output text
            
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Removendo o registro de nome $resourceRecordName com identificador $recordId1 na hosted zone $hostedZoneName"
            aws route53 change-resource-record-sets --hosted-zone-id $hostedZoneId --change-batch "{
                `"Changes`": [
                {
                    `"Action`": `"DELETE`",
                    `"ResourceRecordSet`": {
                    `"Name`": `"${resourceRecordName}`",
                    `"Type`": `"${resourceRecordType}`",
                    `"TTL`": ${ttl},
                    `"ResourceRecords`": [
                        {`"Value`": `"${instanceIP1}`"}
                    ],
                    `"SetIdentifier`": `"${recordId1}`",
                    `"Failover`": `"${failoverRecordType1}`",
                    `"HealthCheckId`": `"${healthCheckId}`"
                    }
                }
                ]
            }"

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todos os registros de nome $resourceRecordName na hosted zone $hostedZoneName"
            aws route53 list-resource-record-sets --hosted-zone-id $hostedZoneId --query "ResourceRecordSets[?Name=='$resourceRecordName.'].SetIdentifier" --output text
        } else {Write-Output "Não existe o registro de nome $resourceRecordName com identificador $recordId1 na hosted zone $hostedZoneName"}    

        # SECONDARY
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe o registro de nome $resourceRecordName com identificador $recordId2 na hosted zone $hostedZoneName"
        if ((aws route53 list-resource-record-sets --hosted-zone-id $hostedZoneId --query "ResourceRecordSets[?Name=='$resourceRecordName.' && SetIdentifier=='$recordId2'].Name").Count -gt 1) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todos os registros de nome $resourceRecordName na hosted zone $hostedZoneName"
            aws route53 list-resource-record-sets --hosted-zone-id $hostedZoneId --query "ResourceRecordSets[?Name=='$resourceRecordName.'].SetIdentifier" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Extraindo o IP da instância $tagNameInstance2"
            $instanceIP2 = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance2" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Verificando se o IP está vazio, caso esteja extraindo o IP da instância $tagNameInstance2 configurado no registro de nome $resourceRecordName"
            if (-not $instanceIP2) {$instanceIP2 = aws route53 list-resource-record-sets --hosted-zone-id $hostedZoneId --query "ResourceRecordSets[?Name=='${resourceRecordName}.' && SetIdentifier=='$recordId2'].ResourceRecords[].Value" --output text}

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Removendo o registro de nome $resourceRecordName com identificador $recordId2 na hosted zone $hostedZoneName"
            aws route53 change-resource-record-sets --hosted-zone-id $hostedZoneId --change-batch "{
                `"Changes`": [
                {
                    `"Action`": `"DELETE`",
                    `"ResourceRecordSet`": {
                    `"Name`": `"${resourceRecordName}`",
                    `"Type`": `"${resourceRecordType}`",
                    `"TTL`": ${ttl},
                    `"ResourceRecords`": [
                        {`"Value`": `"${instanceIP2}`"}
                    ],
                    `"SetIdentifier`": `"${recordId2}`",
                    `"Failover`": `"${failoverRecordType2}`"
                    }
                }
                ]
            }"

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todos os registros de nome $resourceRecordName na hosted zone $hostedZoneName"
            aws route53 list-resource-record-sets --hosted-zone-id $hostedZoneId --query "ResourceRecordSets[?Name=='$resourceRecordName.'].SetIdentifier" --output text
        } else {Write-Output "Não existe o registro de nome $resourceRecordName com identificador $recordId2 na hosted zone $hostedZoneName"}    
    } else {Write-Output "Não existe a hosted zone $hostedZoneName"}
} else {Write-Host "Código não executado"}