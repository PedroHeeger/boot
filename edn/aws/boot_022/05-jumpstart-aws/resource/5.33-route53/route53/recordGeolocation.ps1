#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON ROUTE 53"
Write-Output "RECORD GEOLOCATION-HOSTED ZONE CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
# $hostedZoneName = "hosted-zone-test1.com.br."
# $domainName = "hosted-zone-test1.com.br"
$hostedZoneName = "pedroheeger.dev.br."
$domainName = "pedroheeger.dev.br"
$resourceRecordName = "www.pedroheeger.dev.br"
$resourceRecordType = "A"
$ttl = 15
$tagNameInstanceA = "cafeServer1"
$tagNameInstanceB = "cafeServer2"
$recordId1 = "US-NorthVirginia"
$recordId2 = "Europe-Paris"
$countryCode1 = "BR"
$countryCode2 = "PT"
$region1 = "us-east-1"
$region2 = "eu-west-3"

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
            Write-Output "Extraindo o IP da instância $tagNameInstanceA"
            $instanceIP1 = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstanceA" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --region $region1 --output text

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
                    `"GeoLocation`": {
                        `"CountryCode`": `"${countryCode1}`"
                    }
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
            Write-Output "Extraindo o IP da instância $tagNameInstanceB"
            $instanceIP2 = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstanceB" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --region $region2 --output text

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
                    `"GeoLocation`": {
                        `"CountryCode`": `"${countryCode2}`"
                    }
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
Write-Output "RECORD GEOLOCATION-HOSTED ZONE EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
# $hostedZoneName = "hosted-zone-test1.com.br."
# $domainName = "hosted-zone-test1.com.br"
$hostedZoneName = "pedroheeger.dev.br."
$domainName = "pedroheeger.dev.br"
$resourceRecordName = "www.pedroheeger.dev.br"
$resourceRecordType = "A"
$ttl = 15
$tagNameInstanceA = "cafeServer1"
$tagNameInstanceB = "cafeServer2"
$recordId1 = "US-NorthVirginia"
$recordId2 = "Europe-Paris"
$countryCode1 = "BR"
$countryCode2 = "PT"
$region1 = "us-east-1"
$region2 = "eu-west-3"

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
            Write-Output "Extraindo o IP da instância $tagNameInstanceA"
            $instanceIP1 = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstanceA" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --region $region1 --output text
            
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
                    `"GeoLocation`": {
                        `"CountryCode`": `"${countryCode1}`"
                    }
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
            Write-Output "Extraindo o IP da instância $tagNameInstanceB"
            $instanceIP2 = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstanceB" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --region $region2 --output text
            
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
                    `"GeoLocation`": {
                        `"CountryCode`": `"${countryCode2}`"
                    }
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