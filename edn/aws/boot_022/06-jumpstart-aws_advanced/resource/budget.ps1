#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS BUDGET"
Write-Output "BUDGET CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$accountId = "001727357081"
$budgetName = "Gastos acima de 1.5 dolares"
$limitAmount = 1.5
$threshold = 70
$address = "pedroheeger19@gmail.com"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o budget de nome $budgetName"
    if ((aws budgets describe-budgets --account-id $accountId --query "Budgets[?BudgetName=='${budgetName}'].BudgetName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe o budget de nome $budgetName"
        aws budgets describe-budgets --account-id $accountId --query "Budgets[?BudgetName=='${budgetName}'].BudgetName" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome de todos os budgets criados"
        aws budgets describe-budgets --account-id $accountId --query "Budgets[].BudgetName" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o budget de nome $budgetName (Shorthand Syntax)"
        aws budgets create-budget --account-id $accountId --budget "BudgetName=$budgetName,BudgetLimit={Amount=$limitAmount,Unit=USD},TimeUnit=MONTHLY,BudgetType=COST"

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando um alerta para o orçamento de nome $budgetName (Shorthand Syntax)"
        aws budgets create-notification --account-id $accountId --budget-name $budgetName --notification "NotificationType=ACTUAL,ComparisonOperator=GREATER_THAN,Threshold=$threshold,ThresholdType=PERCENTAGE,NotificationState=ALARM" --subscribers "SubscriptionType=EMAIL,Address=$address"

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome do budget criado"
        aws budgets describe-budgets --account-id $accountId --query "Budgets[?BudgetName=='${budgetName}'].BudgetName" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS BUDGET"
Write-Output "BUDGET EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$accountId = "001727357081"
$budgetName = "Gastos acima de 1.5 dolares"
$threshold = 70
$address = "pedroheeger19@gmail.com"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o budget de nome $budgetName"
    if ((aws budgets describe-budgets --account-id $accountId --query "Budgets[?BudgetName=='${budgetName}'].BudgetName").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome de todos os budgets criados"
        aws budgets describe-budgets --account-id $accountId --query "Budgets[].BudgetName" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe alerta no budget de nome $budgetName"
        if ((aws budgets describe-notifications-for-budget --account-id $accountId --budget-name $budgetName --query "Notifications").Count -gt 1) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Removendo o alerta do budget de nome $budgetName"
            aws budgets delete-notification --account-id $accountId --budget-name $budgetName --notification "NotificationType=ACTUAL,ComparisonOperator=GREATER_THAN,Threshold=$threshold,ThresholdType=PERCENTAGE,NotificationState=ALARM"
        } else {Write-Output "Não existe alerta para o budget de nome $budgetName"}

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo o budget de nome $budgetName"
        aws budgets delete-budget --account-id $accountId --budget-name $budgetName

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome de todos os budgets criados"
        aws budgets describe-budgets --account-id $accountId --query "Budgets[].BudgetName" --output text
    } else {Write-Output "Não existe o budget de nome $budgetName"}
} else {Write-Host "Código não executado"}