
aws ec2 describe-instances --filters "Name=tag:Name,Values=dioServerless5" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text

Resource:
- arn:aws:dynamodb:us-east-1:167880115321:table/ItemTable








$tagNameInstance = "dioServerless5"
$ipEc2 = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
echo $ipEc2

$projectPath = "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\projectDioServerless"
$keyPairPath = "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\automation\secrets"
$keyPairName = "remoteAccessEc2"
$configAwsPath = "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\automation\secrets\config"
$credentialsAwsPath = "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\automation\secrets\credentials"


$ipEc2 = $ipEc2.Replace(".", "-")
echo $ipEc2

pscp -batch -i "$keyPairPath\$keyPairName.ppk" -r "$configAwsPath" ubuntu@ec2-$ipEc2.compute-1.amazonaws.com:/home/ubuntu/.aws















plink -i "$keyPairPath\$keyPairName.ppk" -ssh ubuntu@ec2-$ipEc2.compute-1.amazonaws.com "ls -a ~"


ssh -i "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\automation\secrets\remoteAccessEc2.pem" ubuntu@ec2-107-22-96-249.compute-1.amazonaws.com
pscp -i "$keyPairPath\$keyPairName.ppk" -r "$configAwsPath" ubuntu@ec2-54-92-184-182.compute-1.amazonaws.com:/home/ubuntu/.aws 
scp -i "$keyPairPath\$keyPairName.pem" -r "$configAwsPath" ubuntu@ec2-$ipEc2.compute-1.amazonaws.com:/home/ubuntu/.aws



ssh -i "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\automation\secrets\remoteAccessEc2.pem" ubuntu@ec2-54-92-184-182.compute-1.amazonaws.com "cd projectDioServerless && serverless deploy"

ssh -i "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\automation\secrets\remoteAccessEc2.pem" ubuntu@ec2-54-92-184-182.compute-1.amazonaws.com "cd projectDioServerless"


ssh -i "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\automation\secrets\remoteAccessEc2.pem" ubuntu@ec2-54-80-157-71.compute-1.amazonaws.com "ls -a"

ssh -i "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\automation\secrets\remoteAccessEc2.pem" ubuntu@ec2-54-80-157-71.compute-1.amazonaws.com "cd projectDioServerless && serverless deploy"



ssh -i "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\automation\secrets\remoteAccessEc2.pem" ubuntu@ec2-52-207-36-46.compute-1.amazonaws.com 'aws ec2 describe-instances --filters "Name=tag:Name,Values=dioServerless1" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text'

ssh -i "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\automation\secrets\remoteAccessEc2.pem" ubuntu@ec2-52-207-36-46.compute-1.amazonaws.com 'cd projectDioServerless && ls -a'


ssh -i "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\automation\secrets\remoteAccessEc2.pem" ubuntu@ec2-52-207-36-46.compute-1.amazonaws.com 'cd projectDioServerless && serverless deploy'




scp -i "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\automation\secrets\remoteAccessEc2.pem" -r "G:\Meu Drive\4_PROJ\boot\dio\aws\boot_011\03-aws_foundation\automation\secrets\.aws" ubuntu@ec2-52-207-36-46.compute-1.amazonaws.com:/home/ubuntu/





# Verifica se a pasta existe
if [ -d "home/ubuntu/projectDioServerless" ]; then
    echo "A pasta existe. Entrando na pasta..."
    cd "home/ubuntu/projectDioServerless"

    # Exclui o arquivo desejado (substitua "nome-do-arquivo" pelo nome real do arquivo)
    serverless remove

    echo "Implantação removida."
else
    echo "A pasta não existe."
fi


[ -d "home/ubuntu/projectDioServerless" ] && cd "home/ubuntu/projectDioServerless" && serverless remove