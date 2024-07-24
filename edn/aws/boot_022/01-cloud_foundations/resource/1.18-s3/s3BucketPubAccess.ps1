#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON S3"
Write-Output "ENABLE BUCKET PUBLIC ACCESS"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$bucketName = "acf-edn-s3-demo"
$region = "us-east-1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o bucket de nome $bucketName"
    if ((aws s3api list-buckets --region $region --query "Buckets[?Name=='$bucketName'].Name").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se a configuração de bloqueio de acesso público do bucket de nome $bucketName está desativada"
        if ((aws s3api get-public-access-block --bucket $bucketName --query "PublicAccessBlockConfiguration.BlockPublicAcls && PublicAccessBlockConfiguration.IgnorePublicAcls && PublicAccessBlockConfiguration.RestrictPublicBuckets") -eq "false") {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Já está desativada a configuração de bloqueio de acesso público do bucket de nome $bucketName"
            aws s3api get-public-access-block --bucket $bucketName --query "PublicAccessBlockConfiguration"       
        } else {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando a configuração de bloqueio de acesso público do bucket de nome $bucketName"
            aws s3api get-public-access-block --bucket $bucketName --query "PublicAccessBlockConfiguration" 
        
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Desativando a configuração de bloqueio de acesso público do bucket de nome $bucketName"
            aws s3api put-public-access-block --bucket $bucketName --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=false"

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando a configuração de bloqueio de acesso público do bucket de nome $bucketName"
            aws s3api get-public-access-block --bucket $bucketName --query "PublicAccessBlockConfiguration" 
        }
    } else {Write-Output "Não existe o bucket de nome $bucketName"}
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON S3"
Write-Output "DISABLE BUCKET PUBLIC ACCESS"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$bucketName = "acf-edn-s3-demo"
$region = "us-east-1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o bucket de nome $bucketName"
    if ((aws s3api list-buckets --region $region --query "Buckets[?Name=='$bucketName'].Name").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se a configuração de bloqueio de acesso público do bucket de nome $bucketName está desativada"
        if ((aws s3api get-public-access-block --bucket $bucketName --query "PublicAccessBlockConfiguration.BlockPublicAcls && PublicAccessBlockConfiguration.IgnorePublicAcls && PublicAccessBlockConfiguration.RestrictPublicBuckets") -eq "false") {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando a configuração de bloqueio de acesso público do bucket de nome $bucketName"
            aws s3api get-public-access-block --bucket $bucketName --query "PublicAccessBlockConfiguration" 

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Ativando a configuração de bloqueio de acesso público do bucket de nome $bucketName"
            aws s3api put-public-access-block --bucket $bucketName --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando a configuração de bloqueio de acesso público do bucket de nome $bucketName"
            aws s3api get-public-access-block --bucket $bucketName --query "PublicAccessBlockConfiguration" 
        } else {Write-Output "Não está desativada a configuração de bloqueio de acesso público do bucket de nome $bucketName"}
    } else {Write-Output "Não existe o bucket de nome $bucketName"}
} else {Write-Host "Código não executado"}