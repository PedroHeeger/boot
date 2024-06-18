#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2-AUTO SCALING"
echo "TARGET TRACKING SCALING POLICY CREATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
asttScalingPolicyName="AlarmHigh"
asgName="Web App Auto Scaling Group"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [ "$(echo "$resposta" | tr '[:upper:]' '[:lower:]')" == "y" ]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe a target tracking scaling policy de nome $asttScalingPolicyName no auto scaling group $asgName"
    
    if [[ $(aws autoscaling describe-policies --auto-scaling-group-name $asgName --query "ScalingPolicies[?PolicyName=='$asttScalingPolicyName'].PolicyName" --output text | wc -l) -gt 0 ]]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Já existe a target tracking scaling policy de nome $asttScalingPolicyName no auto scaling group $asgName"
        aws autoscaling describe-policies --auto-scaling-group-name $asgName --query "ScalingPolicies[?PolicyName=='$asttScalingPolicyName'].PolicyName" --output text
    else
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todas as target tracking scaling policies do auto scaling group $asgName"
        aws autoscaling describe-policies --auto-scaling-group-name $asgName --query "ScalingPolicies[?PolicyType=='TargetTrackingScaling'].PolicyName[]" --output text
    
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando a target tracking scaling policy de nome $asttScalingPolicyName no auto scaling group $asgName"
        aws autoscaling put-scaling-policy --policy-name $asttScalingPolicyName --auto-scaling-group-name $asgName --policy-type TargetTrackingScaling --cooldown 300 --target-tracking-configuration "PredefinedMetricSpecification={PredefinedMetricType=ASGAverageCPUUtilization},TargetValue=50.0,DisableScaleIn=false" --no-cli-pager

        # echo "-----//-----//-----//-----//-----//-----//-----"
        # echo "Criando a target tracking scaling policy de nome $asttScalingPolicyName no auto scaling group $asgName"
        # aws autoscaling put-scaling-policy --policy-name $asttScalingPolicyName --auto-scaling-group-name $asgName --policy-type TargetTrackingScaling --cooldown 300 --target-tracking-configuration "PredefinedMetricSpecification={PredefinedMetricType=ASGAverageCPUUtilization},TargetValue=30.0,DisableScaleIn=false" --no-cli-pager

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando a target tracking scaling policy de nome $asttScalingPolicyName no auto scaling group $asgName"
        aws autoscaling describe-policies --auto-scaling-group-name $asgName --query "ScalingPolicies[?PolicyName=='$asttScalingPolicyName'].PolicyName" --output text
    fi
else
    echo "Código não executado"
fi




#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2-AUTO SCALING"
echo "TARGET TRACKING SCALING POLICY EXCLUSION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
asttScalingPolicyName="AlarmHigh"
asgName="Web App Auto Scaling Group"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [ "$(echo "$resposta" | tr '[:upper:]' '[:lower:]')" == "y" ]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe a target tracking scaling policy de nome $asttScalingPolicyName no auto scaling group $asgName"
    
    if [[ $(aws autoscaling describe-policies --auto-scaling-group-name $asgName --query "ScalingPolicies[?PolicyName=='$asttScalingPolicyName'].PolicyName" --output text | wc -l) -gt 0 ]]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todas as target tracking scaling policies do auto scaling group $asgName"
        aws autoscaling describe-policies --auto-scaling-group-name $asgName --query "ScalingPolicies[?PolicyType=='TargetTrackingScaling'].PolicyName[]" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Removendo a target tracking scaling policy de nome $asttScalingPolicyName no auto scaling group $asgName"
        aws autoscaling delete-policy --auto-scaling-group-name $asgName --policy-name $asttScalingPolicyName

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todas as target tracking scaling policies do auto scaling group $asgName"
        aws autoscaling describe-policies --auto-scaling-group-name $asgName --query "ScalingPolicies[?PolicyType=='TargetTrackingScaling'].PolicyName[]" --output text
    else
        echo "Não existe a target tracking scaling policy de nome $asttScalingPolicyName no auto scaling group $asgName"
    fi
else
    echo "Código não executado"
fi