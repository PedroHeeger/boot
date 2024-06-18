#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2-AUTO SCALING"
echo "AUTO SCALING GROUP CREATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
asgName="Web App Auto Scaling Group"
launchTempName="web-app-launch-template"
versionNumber=1
tgName="webserver-app"
aZ1="us-east-1a"
aZ2="us-east-1b"
tagNameInstance="WebApp"
vpcName="Lab VPC"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [ "$(echo "$resposta" | tr '[:upper:]' '[:lower:]')" == "y" ]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe o auto scaling group de nome $asgName"
    if [ $(aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[?AutoScalingGroupName=='$asgName'].AutoScalingGroupName" --output text | wc -l) -gt 1 ]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Já existe o auto scaling group de nome $asgName"
        aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[?AutoScalingGroupName=='$asgName'].AutoScalingGroupName" --output text
    else
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todos os auto scaling groups existentes"
        aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[].AutoScalingGroupName" --output text
    
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Extraindo o ARN do target group $tgName"
        tgArn=$(aws elbv2 describe-target-groups --query "TargetGroups[?TargetGroupName=='$tgName'].TargetGroupArn" --output text)

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Extraindo os IDs dos elementos de rede"
        vpcId=$(aws ec2 describe-vpcs --filters "Name=tag:Name,Values=$vpcName" --query "Vpcs[].VpcId" --output text)
        subnetId1=$(aws ec2 describe-subnets --filters "Name=availability-zone,Values=$aZ1" "Name=vpc-id,Values=$vpcId" --query "Subnets[].SubnetId" --output text)
        subnetId2=$(aws ec2 describe-subnets --filters "Name=availability-zone,Values=$aZ2" "Name=vpc-id,Values=$vpcId" --query "Subnets[].SubnetId" --output text)

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando o auto scaling group de nome $asgName"
        aws autoscaling create-auto-scaling-group --auto-scaling-group-name $asgName --launch-template "LaunchTemplateName=$launchTempName,Version=$versionNumber" --min-size 2 --max-size 4 --desired-capacity 2 --default-cooldown 300 --health-check-type EC2 --health-check-grace-period 300 --vpc-zone-identifier "$subnetId1,$subnetId2" --tags "Key=Name,Value=$tagNameInstance,PropagateAtLaunch=true" --target-group-arn $tgArn

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Habilitando a coleta de métricas do auto scaling group de nome $asgName"
        aws autoscaling enable-metrics-collection --auto-scaling-group-name $asgName --metrics "GroupMinSize" "GroupMaxSize" "GroupDesiredCapacity" "GroupInServiceInstances" "GroupPendingInstances" "GroupStandbyInstances" "GroupTerminatingInstances" "GroupTotalInstances" --granularity "1Minute"

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o auto scaling group de nome $asgName"
        aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[?AutoScalingGroupName=='$asgName'].AutoScalingGroupName" --output text
    fi
else
    echo "Código não executado"
fi




#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2-AUTO SCALING"
echo "AUTO SCALING GROUP EXCLUSION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
asgName="Web App Auto Scaling Group"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [ "$(echo "$resposta" | tr '[:upper:]' '[:lower:]')" == "y" ]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe o auto scaling group de nome $asgName"
    if [ $(aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[?AutoScalingGroupName=='$asgName'].AutoScalingGroupName" --output text | wc -l) -gt 1 ]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todos os grupos de auto scaling existentes"
        aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[].AutoScalingGroupName" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Removendo o auto scaling group de nome $asgName"
        aws autoscaling delete-auto-scaling-group --auto-scaling-group-name $asgName --force-delete

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todos os grupos de auto scaling existentes"
        aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[].AutoScalingGroupName" --output text
    else
        echo "Não existe o auto scaling group de nome $asgName"
    fi
else
    echo "Código não executado"
fi