#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON S3"
Write-Output "OBJECT CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$bucketName = "acf-edn-s3-demo"
$region = "us-east-1"
$objectName = "objTest.png"
$filePath = "G:/Meu Drive/4_PROJ/boot/edn/aws/boot_022/01-cloud_foundations/resource/1.18-s3"
$fileName = "objTest.png"
$storageClass = "STANDARD"
$contentType = "image/png"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o bucket de nome $bucketName"
    if ((aws s3api list-buckets --region $region --query "Buckets[?Name=='$bucketName'].Name").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe o objeto de nome $objectName no bucket $bucketName"
        if ((aws s3api list-objects --bucket $bucketName --query "Contents[?Key=='$objectName'].Key").Count -gt 1) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Já existe o objeto de nome $objectName no bucket $bucketName"   
            aws s3api list-objects --bucket $bucketName --query "Contents[?Key=='$objectName'].Key" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando a URL do objeto de nome $objectName"
            Write-Output "https://$bucketName.s3.amazonaws.com/$objectName" 
        } else {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todos os objetos no bucket $bucketName"
            aws s3api list-objects --bucket $bucketName --query "Contents[].Key" --output text
        
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Criando o objeto de nome $objectName no bucket $bucketName"
            aws s3api put-object --bucket $bucketName --key $objectName --body "$filePath/$fileName" --storage-class $storageClass --content-type $contentType
    
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando o objeto de nome $objectName no bucket $bucketName"
            aws s3api list-objects --bucket $bucketName --query "Contents[?Key=='$objectName'].Key" --output text  

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando a URL do objeto de nome $objectName"
            Write-Output "https://$bucketName.s3.amazonaws.com/$objectName" 
        }
    } else {Write-Output "Não existe o bucket de nome $bucketName"}
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON S3"
Write-Output "OBJECT EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$bucketName = "acf-edn-s3-demo"
$region = "us-east-1"
$objectName = "objTest.png"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o bucket de nome $bucketName"
    if ((aws s3api list-buckets --region $region --query "Buckets[?Name=='$bucketName'].Name").Count -gt 1) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe o objeto de nome $objectName no bucket $bucketName"
        if ((aws s3api list-objects --bucket $bucketName --query "Contents[?Key=='$objectName'].Key").Count -gt 1) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todos os objetos no bucket $bucketName"
            aws s3api list-objects --bucket $bucketName --query "Contents[].Key" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Removendo o objeto de nome $objectName no bucket $bucketName"
            aws s3api delete-object --bucket $bucketName --key $objectName

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todos os objetos no bucket $bucketName"
            aws s3api list-objects --bucket $bucketName --query "Contents[].Key" --output text
        } else {Write-Output "Não existe o objeto de nome $objectName no bucket $bucketName"}
    } else {Write-Output "Não existe o bucket de nome $bucketName"}    
} else {Write-Host "Código não executado"}