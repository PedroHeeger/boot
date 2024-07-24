#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON S3"
Write-Output "ACL OBJECT CHANGE"

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
        Write-Output "Verificando se foi configurado as permissões de leitura para entidade everyone da ACL sobre o objeto de nome $objectName (Acesso Público)"
        if ((aws s3api get-object-acl --bucket $bucketName --key $objectName --query "Grants[?Grantee.URI=='http://acs.amazonaws.com/groups/global/AllUsers' && Permission=='READ'].Permission").Count -gt 1) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Já foi configurado as permissões de leitura para entidade everyone da ACL sobre o objeto de nome $objectName (Acesso Público)"
            aws s3api get-object-acl --bucket $bucketName --key $objectName --query "Grants[?Grantee.URI=='http://acs.amazonaws.com/groups/global/AllUsers'].Permission" --output text       
        } else {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todas as permissões que a entidade everyone da ACL possuí no objeto de nome $objectName"
            aws s3api get-object-acl --bucket $bucketName --key $objectName --query "Grants[?Grantee.URI=='http://acs.amazonaws.com/groups/global/AllUsers'].Permission"

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Concedendo permissões de leitura para entidade everyone da ACL sobre o objeto de nome $objectName (Acesso Público)"
            aws s3api put-object-acl --bucket $bucketName --key $objectName --acl public-read

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando a configuração de permissões de leitura para entidade everyone da ACL sobre o objeto de nome $objectName (Acesso Público)"
            aws s3api get-object-acl --bucket $bucketName --key $objectName --query "Grants[?Grantee.URI=='http://acs.amazonaws.com/groups/global/AllUsers'].Permission" --output text   
        }
    } else {Write-Output "Não existe o bucket de nome $bucketName"}
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON S3"
Write-Output "ACL OBJECT CHANGE DEFAULT"

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
        Write-Output "Verificando se foi configurado as permissões de leitura para entidade everyone da ACL sobre o objeto de nome $objectName (Acesso Público)"
        if ((aws s3api get-object-acl --bucket $bucketName --key $objectName --query "Grants[?Grantee.URI=='http://acs.amazonaws.com/groups/global/AllUsers' && Permission=='READ'].Permission").Count -gt 1) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todas as permissões que a entidade everyone da ACL possuí no objeto de nome $objectName"
            aws s3api get-object-acl --bucket $bucketName --key $objectName --query "Grants[?Grantee.URI=='http://acs.amazonaws.com/groups/global/AllUsers'].Permission"

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Restringindo permissões de leitura para entidade everyone da ACL sobre o objeto de nome $objectName (Acesso Público)"
            aws s3api put-object-acl --bucket $bucketName --key $objectName --acl private

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todas as permissões que a entidade everyone da ACL possuí no objeto de nome $objectName"
            aws s3api get-object-acl --bucket $bucketName --key $objectName --query "Grants[?Grantee.URI=='http://acs.amazonaws.com/groups/global/AllUsers'].Permission"
        } else {Write-Output "Não foi configurado permissões de leitura para entidade everyone da ACL sobre o objeto de nome $objectName (Acesso Público)"}
    } else {Write-Output "Não existe o bucket de nome $bucketName"}
} else {Write-Host "Código não executado"}