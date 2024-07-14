#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS RDS"
Write-Output "DB CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$dbInstanceName = "edn-myacfdb"
$dbInstanceClass = "db.t3.micro"
$engine = "mysql"
$engineVersion = "8.0.35"
$masterUsername = "masterUsernameEdn1"
$masterPassword = "masterPasswordEdn1"
$allocatedStorage = 20
$storageType = "gp2"
$dbName = "ednAcfdb"
$periodBackup = 0
$sgName = "default"
$aZ = "us-east-1a"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe a instância de banco de nome $dbInstanceName (Ignorando erro)..."
    $erro = "DBInstanceNotFound"
    if ((aws rds describe-db-instances --db-instance-identifier $dbInstanceName --query "DBInstances[].DBInstanceStatus" 2>&1) -match $erro)
    {$condition = 0} 
    else{$condition = (aws rds describe-db-instances --db-instance-identifier $dbInstanceName --query "DBInstances[].DBInstanceStatus" --output text)}

    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe a instância de banco de nome $dbInstanceName"
    $excludedStatus = "deleting", "failed", "stopped", "stopping", 0
    if ($condition -notin $excludedStatus) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe a instância de banco de nome $dbInstanceName"
        aws rds describe-db-instances --db-instance-identifier $dbInstanceName --query "DBInstances[].DBInstanceIdentifier" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todas as instâncias de banco criadas"
        aws rds describe-db-instances --query "DBInstances[].DBInstanceIdentifier" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id dos elementos de rede"
        $sgId = aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando a instância de banco de nome $dbInstanceName"
        aws rds create-db-instance --db-instance-identifier $dbInstanceName --db-instance-class $dbInstanceClass --engine $engine --engine-version $engineVersion --master-username $masterUsername --master-user-password $masterPassword --allocated-storage $allocatedStorage --max-allocated-storage $allocatedStorage --storage-type $storageType --db-name $dbName --vpc-security-group-ids $sgId --availability-zone $aZ --backup-retention-period $periodBackup --no-enable-iam-database-authentication --no-storage-encrypted --no-copy-tags-to-snapshot --no-enable-performance-insights --no-auto-minor-version-upgrade --no-cli-pager
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando a instância de banco de nome $dbInstanceName"
        aws rds describe-db-instances --db-instance-identifier $dbInstanceName --query "DBInstances[].DBInstanceIdentifier" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS RDS"
Write-Output "DB EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$dbInstanceName = "edn-myacfdb"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe a instância de banco de nome $dbInstanceName (Ignorando erro)..."
    $erro = "DBInstanceNotFound"
    if ((aws rds describe-db-instances --db-instance-identifier $dbInstanceName --query "DBInstances[].DBInstanceStatus" 2>&1) -match $erro)
    {$condition = 0} 
    else{$condition = (aws rds describe-db-instances --db-instance-identifier $dbInstanceName --query "DBInstances[].DBInstanceStatus" --output text)}

    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe a instância de banco de nome $dbInstanceName"
    $excludedStatus = "deleting", "failed", "stopped", "stopping", 0
    if ($condition -notin $excludedStatus) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todas as instâncias de banco criadas"
        aws rds describe-db-instances --query "DBInstances[].DBInstanceIdentifier" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo a instância de banco de nome $dbInstanceName"
        aws rds delete-db-instance --db-instance-identifier $dbInstanceName --skip-final-snapshot --delete-automated-backups --no-cli-pager

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todas as instâncias de banco criadas"
        aws rds describe-db-instances --query "DBInstances[].DBInstanceIdentifier" --output text
    } else {Write-Output "Não existe a instância de banco de nome $dbInstanceName"}
} else {Write-Host "Código não executado"}