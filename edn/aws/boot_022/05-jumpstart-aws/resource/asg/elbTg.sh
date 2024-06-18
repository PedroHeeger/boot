#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2-ELB"
echo "TARGET GROUP CREATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
tgName="webserver-app"
tgType="instance"
# tgType="ip"
tgProtocol="HTTP"
tgProtocolVersion="HTTP1"
tgPort=80
tgHealthCheckProtocol="HTTP"
tgHealthCheckPort="traffic-port"
tgHealthCheckPath="/index.php"
vpcName="Lab VPC"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [ "$(echo "$resposta" | tr '[:upper:]' '[:lower:]')" == "y" ]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe o target group de nome $tgName"
    if [[ $(aws elbv2 describe-target-groups --query "TargetGroups[?TargetGroupName=='$tgName'].TargetGroupName" --output text | wc -l) -gt 1 ]]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Já existe o target group de nome $tgName"
        aws elbv2 describe-target-groups --query "TargetGroups[?TargetGroupName=='$tgName'].TargetGroupName" --output text
    else
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todos os target groups criados"
        aws elbv2 describe-target-groups --query "TargetGroups[].TargetGroupName" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Extraindo o Id da VPC padrão"
        vpcId=$(aws ec2 describe-vpcs --filters "Name=tag:Name,Values=$vpcName" --query "Vpcs[].VpcId" --output text)
    
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando o target group de nome $tgName"
        aws elbv2 create-target-group --name $tgName --target-type $tgType --protocol $tgProtocol --protocol-version $tgProtocolVersion --port $tgPort --vpc-id $vpcId --health-check-protocol $tgHealthCheckProtocol --health-check-port $tgHealthCheckPort --health-check-path $tgHealthCheckPath --healthy-threshold 5 --unhealthy-threshold 2 --health-check-timeout-seconds 5 --health-check-interval-seconds 15 --matcher "HttpCode=200-299" --no-cli-pager

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o target group de nome $tgName"
        aws elbv2 describe-target-groups --query "TargetGroups[?TargetGroupName=='$tgName'].TargetGroupName" --output text
    fi
else
    echo "Código não executado"
fi




#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2-ELB"
echo "TARGET GROUP EXCLUSION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
tgName="webserver-app"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [ "$(echo "$resposta" | tr '[:upper:]' '[:lower:]')" == "y" ]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe o target group de nome $tgName"
    if [[ $(aws elbv2 describe-target-groups --query "TargetGroups[?TargetGroupName=='$tgName'].TargetGroupName" --output text | wc -l) -gt 0 ]]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todos os target groups criados"
        aws elbv2 describe-target-groups --query "TargetGroups[].TargetGroupName" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Extraindo a ARN do target group de nome $tgName"
        tgArn=$(aws elbv2 describe-target-groups --query "TargetGroups[?TargetGroupName=='$tgName'].TargetGroupArn" --output text)

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Removendo o target group de nome $tgName"
        aws elbv2 delete-target-group --target-group-arn $tgArn

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todos os target groups criados"
        aws elbv2 describe-target-groups --query "TargetGroups[].TargetGroupName" --output text
    else
        echo "Não existe o target group de nome $tgName"
    fi
else
    echo "Código não executado"
fi