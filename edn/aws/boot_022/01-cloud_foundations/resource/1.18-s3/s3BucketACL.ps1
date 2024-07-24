#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON S3"
Write-Output "ACL BUCKET CHANGE"

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
        Write-Output "Verificando se foi configurado as permissões de leitura para entidade everyone da ACL sobre os objetos do bucket de nome $bucketName (Acesso Público)"
        if ((aws s3api get-bucket-acl --bucket $bucketName --query "Grants[?Grantee.URI=='http://acs.amazonaws.com/groups/global/AllUsers' && Permission=='READ'].Permission").Count -gt 1) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Já foi configurado as permissões de leitura para entidade everyone da ACL sobre os objetos do bucket de nome $bucketName (Acesso Público)"
            aws s3api get-bucket-acl --bucket $bucketName --query "Grants[?Grantee.URI=='http://acs.amazonaws.com/groups/global/AllUsers'].Permission" --output text       
        } else {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todas as permissões que a entidade everyone da ACL possuí no bucket de nome $bucketName"
            aws s3api get-bucket-acl --bucket $bucketName --query "Grants[?Grantee.URI=='http://acs.amazonaws.com/groups/global/AllUsers'].Permission"
            
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Verificando se o controle de propriedade dos objetos (Object Ownership) do bucket de nome $bucketName é o BucketOwnerPreferred"
            if ((aws s3api get-bucket-ownership-controls --bucket $bucketName --query "OwnershipControls.Rules[?ObjectOwnership=='BucketOwnerPreferred'].ObjectOwnership").Count -gt 1) {
                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Já foi configurado o proprietário dos objetos no bucket de nome $bucketName para BucketOwnerPreferred"
                aws s3api get-bucket-ownership-controls --bucket $bucketName --query "OwnershipControls.Rules[].ObjectOwnership" --output text   
            } else {
                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Listando o proprietário dos objetos no bucket de nome $bucketName"
                aws s3api get-bucket-ownership-controls --bucket $bucketName --query "OwnershipControls.Rules[].ObjectOwnership" --output text
                
                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Alterando o proprietário dos objetos no bucket de nome $bucketName para BucketOwnerPreferred"
                aws s3api put-bucket-ownership-controls --bucket $bucketName --ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"

                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Listando o proprietário dos objetos no bucket de nome $bucketName"
                aws s3api get-bucket-ownership-controls --bucket $bucketName --query "OwnershipControls.Rules[].ObjectOwnership" --output text 
            }
            
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Concedendo permissões de leitura para entidade everyone da ACL sobre os objetos do bucket de nome $bucketName"
            aws s3api put-bucket-acl --bucket $bucketName --acl public-read

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando a configuração de permissões de leitura para entidade everyone da ACL sobre os objetos do bucket de nome $bucketName (Acesso Público)"
            aws s3api get-bucket-acl --bucket $bucketName --query "Grants[?Grantee.URI=='http://acs.amazonaws.com/groups/global/AllUsers'].Permission" --output text 
        }
    } else {Write-Output "Não existe o bucket de nome $bucketName"}
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON S3"
Write-Output "ACL BUCKET CHANGE DEFAULT"

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
        Write-Output "Verificando se foi configurado as permissões de leitura para entidade everyone da ACL sobre os objetos do bucket de nome $bucketName (Acesso Público)"
        if ((aws s3api get-bucket-acl --bucket $bucketName --query "Grants[?Grantee.URI=='http://acs.amazonaws.com/groups/global/AllUsers' && Permission=='READ'].Permission").Count -gt 1) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todas as permissões que a entidade everyone da ACL possuí no bucket de nome $bucketName"
            aws s3api get-bucket-acl --bucket $bucketName --query "Grants[?Grantee.URI=='http://acs.amazonaws.com/groups/global/AllUsers'].Permission"

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Restringindo as permissões de leitura para entidade everyone da ACL sobre os objetos do bucket de nome $bucketName"
            aws s3api put-bucket-acl --bucket $bucketName --acl private

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Verificando se o controle de propriedade dos objetos (Object Ownership) do bucket de nome $bucketName é o BucketOwnerPreferred"
            if ((aws s3api get-bucket-ownership-controls --bucket $bucketName --query "OwnershipControls.Rules[?ObjectOwnership=='BucketOwnerPreferred'].ObjectOwnership").Count -gt 1) {
                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Listando o proprietário dos objetos no bucket de nome $bucketName"
                aws s3api get-bucket-ownership-controls --bucket $bucketName --query "OwnershipControls.Rules[].ObjectOwnership" --output text
                
                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Alterando o proprietário dos objetos no bucket de nome $bucketName para BucketOwnerEnforced"
                aws s3api put-bucket-ownership-controls --bucket $bucketName --ownership-controls="Rules=[{ObjectOwnership=BucketOwnerEnforced}]"

                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Listando o proprietário dos objetos no bucket de nome $bucketName"
                aws s3api get-bucket-ownership-controls --bucket $bucketName --query "OwnershipControls.Rules[].ObjectOwnership" --output text 
            } else {rite-Output "Não foi configurado o proprietário dos objetos no bucket de nome $bucketName para BucketOwnerPreferred"}

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todas as permissões que a entidade everyone da ACL possuí no bucket de nome $bucketName"
            aws s3api get-bucket-acl --bucket $bucketName --query "Grants[?Grantee.URI=='http://acs.amazonaws.com/groups/global/AllUsers'].Permission"
        } else {Write-Output "Não foi configurado as permissões de leitura para entidade everyone da ACL sobre os objetos do bucket de nome $bucketName (Acesso Público)"}
    } else {Write-Output "Não existe o bucket de nome $bucketName"}
} else {Write-Host "Código não executado"}