#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EKS"
Write-Output "CLUSTER CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$clusterName = "clusterEKSTest1"
$eksRoleName = "eksClusterRole"
$sgName = "default"
$aZ1 = "us-east-1a"
$aZ2 = "us-east-1b"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o cluster de nome $clusterName (Ignorando erro)..."
    $erro = "ResourceNotFoundException"
    if ((aws eks describe-cluster --name $clusterName --query "cluster.status" 2>&1) -match $erro)
    {$condition = 0} 
    else {$condition = (aws eks describe-cluster --name $clusterName --query "cluster.status" --output text)}

    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o cluster de nome $clusterName"
    $excludedStatus = "ACTIVE", "CREATING", 0
    if ($condition -in $excludedStatus) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe o cluster de nome $clusterName"
        aws eks describe-cluster --name $clusterName --query "cluster.name" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os clusters criados"
        aws eks list-clusters --query "clusters[]" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o ARN da role $eksRoleName"
        $eksRoleArn = aws iam list-roles --query "Roles[?RoleName=='$eksRoleName'].Arn" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo os Ids dos elementos de rede"
        $sgId = aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --output text
        $subnet1Id = aws ec2 describe-subnets --query "Subnets[?AvailabilityZone=='$aZ1'].SubnetId" --output text
        $subnet2Id = aws ec2 describe-subnets --query "Subnets[?AvailabilityZone=='$aZ2'].SubnetId" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando um cluster de nome $clusterName"
        aws eks create-cluster --name $clusterName --role-arn $eksRoleArn --resources-vpc-config "subnetIds=$subnet1Id,$subnet2Id,securityGroupIds=$sgId" --no-cli-pager

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o cluster de nome $clusterName"
        aws eks describe-cluster --name $clusterName --query "cluster.name" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EKS"
Write-Output "CLUSTER EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$clusterName = "clusterEKSTest1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o cluster de nome $clusterName (Ignorando erro)..."
    $erro = "ResourceNotFoundException"
    if ((aws eks describe-cluster --name $clusterName --query "cluster.status" 2>&1) -match $erro)
    {$condition = 0} 
    else {$condition = (aws eks describe-cluster --name $clusterName --query "cluster.status" --output text)}

    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o cluster de nome $clusterName"
    $excludedStatus = "ACTIVE", "CREATING", 0
    if ($condition -in $excludedStatus) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os clusters criados"
        aws eks list-clusters --query "clusters[]" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo o cluster de nome $clusterName"
        aws eks delete-cluster --name $clusterName --no-cli-pager

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os clusters criados"
        aws eks list-clusters --query "clusters[]" --output text
    } else {Write-Output "Não existe o cluster de nome $clusterName"}
} else {Write-Host "Código não executado"}