#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EKS"
Write-Output "NODE GROUP CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$clusterName = "clusterEKSBoot015"
$nodeGroupName = "nodeGroupTest1"
$eksNodeGroupRoleName = "eksEC2Role"
$amiType = "AL2_x86_64"
$instanceType = "t3.small"
$diskSize = 10
$minSize = 2
$maxSize = 2
$desiredSize = 2
$aZ1 = "us-east-1a"
$aZ2 = "us-east-1b"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o node group de nome $nodeGroupName no cluster $clusterName (Ignorando erro)..."
    $erro = "ResourceNotFoundException"
    if ((aws eks describe-nodegroup --cluster-name $clusterName --nodegroup-name $nodeGroupName --query "nodegroup.nodegroupName" 2>&1) -match $erro)
    {$condition = 0} 
    else {$condition = (aws eks describe-nodegroup --cluster-name $clusterName --nodegroup-name $nodeGroupName --query "nodegroup.status" --output text)}

    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o node group de nome $nodeGroupName no cluster $clusterName"
    $excludedStatus = "ACTIVE", "CREATING", "UPDATING", "DELETE_FAILED"
    if ($condition -in $excludedStatus) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe o node group de nome $nodeGroupName no cluster $clusterName"
        aws eks describe-nodegroup --cluster-name $clusterName --nodegroup-name $nodeGroupName --query "nodegroup.nodegroupName" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os node groups do cluster $clusterName"
        aws eks list-nodegroups --cluster-name $clusterName --query "nodegroups" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o ARN da role $eksNodeGroupRoleName"
        $eksNodeGroupRoleArn = aws iam list-roles --query "Roles[?RoleName=='$eksNodeGroupRoleName'].Arn" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo os Ids dos elementos de rede"
        $subnet1Id = aws ec2 describe-subnets --query "Subnets[?AvailabilityZone=='$aZ1'].SubnetId" --output text
        $subnet2Id = aws ec2 describe-subnets --query "Subnets[?AvailabilityZone=='$aZ2'].SubnetId" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando um node group de nome $nodeGroupName no cluster $clusterName"
        aws eks create-nodegroup --cluster-name $clusterName --nodegroup-name $nodeGroupName --subnets $subnet1Id $subnet2Id --instance-types $instanceType --ami-type $amiType --disk-size $diskSize --node-role $eksNodeGroupRoleArn --capacity-type "ON_DEMAND" --scaling-config "minSize=$minSize,maxSize=$maxSize,desiredSize=$desiredSize" --no-cli-pager

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o node group de nome $nodeGroupName no cluster $clusterName"
        aws eks describe-nodegroup --cluster-name $clusterName --nodegroup-name $nodeGroupName --query "nodegroup.nodegroupName" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EKS"
Write-Output "NODE GROUP EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$clusterName = "clusterEKSBoot015"
$nodeGroupName = "nodeGroupTest1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o node group de nome $nodeGroupName no cluster $clusterName (Ignorando erro)..."
    $erro = "ResourceNotFoundException"
    if ((aws eks describe-nodegroup --cluster-name $clusterName --nodegroup-name $nodeGroupName --query "nodegroup.nodegroupName" 2>&1) -match $erro)
    {$condition = 0} 
    else {$condition = (aws eks describe-nodegroup --cluster-name $clusterName --nodegroup-name $nodeGroupName --query "nodegroup.status" --output text)}

    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o node group de nome $nodeGroupName no cluster $clusterName"
    $excludedStatus = "ACTIVE", "CREATING", "UPDATING", "DELETE_FAILED"
    if ($condition -in $excludedStatus) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os node groups do cluster $clusterName"
        aws eks list-nodegroups --cluster-name $clusterName --query "nodegroups" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo o node group de nome $nodeGroupName do cluster $clusterName"
        aws eks delete-nodegroup --cluster-name $clusterName --nodegroup-name $nodeGroupName --no-cli-pager

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os node groups do cluster $clusterName"
        aws eks list-nodegroups --cluster-name $clusterName --query "nodegroups" --output text
    } else {Write-Output "Não existe o node group de nome $nodeGroupName no cluster $clusterName"}
} else {Write-Host "Código não executado"}