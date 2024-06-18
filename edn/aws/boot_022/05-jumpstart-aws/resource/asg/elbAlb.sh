#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2-ELB"
echo "APPLICATION LOAD BALANCER (ALB) CREATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
albName="WebServerELB"
aZ1="us-west-2a"
aZ2="us-west-2b"
sgName="HTTPAccess"
vpcName="Lab VPC"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [ "$(echo "$resposta" | tr '[:upper:]' '[:lower:]')" == "y" ]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe o load balancer de nome $albName"
    if [ $(aws elbv2 describe-load-balancers --query "LoadBalancers[?LoadBalancerName=='$albName'].LoadBalancerName" --output text | wc -l) -gt 0 ]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Já existe o load balancer de nome $albName"
        aws elbv2 describe-load-balancers --query "LoadBalancers[?LoadBalancerName=='$albName'].LoadBalancerName" --output text
    else
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todos os load balancers criados"
        aws elbv2 describe-load-balancers --query "LoadBalancers[].LoadBalancerName" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Extraindo os elementos de rede"
        vpcId=$(aws ec2 describe-vpcs --filters "Name=tag:Name,Values=$vpcName" --query "Vpcs[].VpcId" --output text)
        subnetId1=$(aws ec2 describe-subnets --filters "Name=availability-zone,Values=$aZ1" "Name=vpc-id,Values=$vpcId" "Name=tag:Name,Values=Public Subnet 1" --query "Subnets[].SubnetId" --output text)
        subnetId2=$(aws ec2 describe-subnets --filters "Name=availability-zone,Values=$aZ2" "Name=vpc-id,Values=$vpcId" "Name=tag:Name,Values=Public Subnet 2" --query "Subnets[].SubnetId" --output text)
        sgId=$(aws ec2 describe-security-groups --filters "Name=vpc-id,Values=$vpcId" "Name=group-name,Values=$sgName" --query "SecurityGroups[].GroupId" --output text)
    
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando o load balancer de nome $albName"
        aws elbv2 create-load-balancer --name $albName --type application --scheme internet-facing --ip-address-type ipv4 --subnets $subnetId1 $subnetId2 --security-groups $sgId --no-cli-pager

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o load balancer de nome $albName"
        aws elbv2 describe-load-balancers --query "LoadBalancers[?LoadBalancerName=='$albName'].LoadBalancerName" --output text
    fi
else
    echo "Código não executado"
fi




#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2-ELB"
echo "APPLICATION LOAD BALANCER (ALB) EXCLUSION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
albName="WebServerELB"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [ "$(echo "$resposta" | tr '[:upper:]' '[:lower:]')" == "y" ]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe o load balancer de nome $albName"
    if [ $(aws elbv2 describe-load-balancers --query "LoadBalancers[?LoadBalancerName=='$albName'].LoadBalancerName" --output text | wc -l) -gt 0 ]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todos os load balancers criados"
        aws elbv2 describe-load-balancers --query "LoadBalancers[].LoadBalancerName" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Extraindo a ARN do load balancer de nome $albName"
        lbArn=$(aws elbv2 describe-load-balancers --query "LoadBalancers[?LoadBalancerName=='$albName'].LoadBalancerArn" --output text)

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Removendo o load balancer de nome $albName"
        aws elbv2 delete-load-balancer --load-balancer-arn $lbArn

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todos os load balancers criados"
        aws elbv2 describe-load-balancers --query "LoadBalancers[].LoadBalancerName" --output text
    else
        echo "Não existe o load balancer de nome $albName"
    fi
else
    echo "Código não executado"
fi