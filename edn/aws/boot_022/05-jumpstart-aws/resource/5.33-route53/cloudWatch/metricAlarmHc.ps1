#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON CLOUDWATCH"
Write-Output "METRIC ALARM HEALTH CHECK CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$metricAlarmName = "healthCheckMetricAlarmEdn1"
$metricAlarmDescription = "metricAlarmDescriptionEdn1"
$metricName = "HealthCheckStatus"
$namespace = "AWS/Route53"
$statistic = "Average"           # Se a média dos resultados da métrica em apenas 1 período no intervalo de tempo de 60 segundos for menor que o limite de 1, o alarme é acionado
$period = 60
$threshold = 1
$comparisonOperator = "LessThanThreshold"
$evaluationPeriods = 1

$resourceKey = "HealthCheckId"
$healthCheckName = "londres-website-status"
$topicName = "websitedown"
$region = "us-east-1"
$accountId = "001727357081"
$topicArn = "arn:aws:sns:${region}:${accountId}:$topicName"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o metric alarm de nome $metricAlarmName"
    if ((aws cloudwatch describe-alarms --query "MetricAlarms[?AlarmName=='$metricAlarmName'].AlarmName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe o metric alarm de nome $metricAlarmName"
        aws cloudwatch describe-alarms --query "MetricAlarms[?AlarmName=='$metricAlarmName'].AlarmName" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os metric alarms existentes"
        aws cloudwatch describe-alarms --query "MetricAlarms[].AlarmName" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o ID da verificação de integridade de nome $healthCheckName"
        $healthCheckId = aws route53 list-health-checks --query "HealthChecks[?CallerReference=='$healthCheckName'].Id" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o metric alarm de nome $metricAlarmName"
        aws cloudwatch put-metric-alarm --alarm-name $metricAlarmName --alarm-description $metricAlarmDescription --metric-name $metricName --namespace $namespace --statistic $statistic --period $period --threshold $threshold --comparison-operator $comparisonOperator --evaluation-periods $evaluationPeriods --dimensions "Name=$resourceKey,Value=$healthCheckId" --alarm-actions $topicArn --ok-actions $topicArn

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o metric alarm de nome $metricAlarmName"
        aws cloudwatch describe-alarms --query "MetricAlarms[?AlarmName=='$metricAlarmName'].AlarmName" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON CLOUDWATCH"
Write-Output "METRIC ALARM HEALTH CHECK EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$metricAlarmName = "healthCheckMetricAlarmEdn1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o metric alarm de nome $metricAlarmName"
    if ((aws cloudwatch describe-alarms --query "MetricAlarms[?AlarmName=='$metricAlarmName'].AlarmName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os metric alarms existentes"
        aws cloudwatch describe-alarms --query "MetricAlarms[].AlarmName" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo o metric alarm de nome $metricAlarmName"
        aws cloudwatch delete-alarms --alarm-names $metricAlarmName

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os metric alarms existentes"
        aws cloudwatch describe-alarms --query "MetricAlarms[].AlarmName" --output text
    } else {Write-Output "Não existe o metric alarm de nome $metricAlarmName"}
} else {Write-Host "Código não executado"}