
echo "-----//-----//-----//-----//-----//-----//-----"
echo "Criando as imagens Docker"
docker build -t pedroheeger/boot015_projeto-backend:1.0 backend/.
docker build -t pedroheeger/boot015_projeto-database:1.0 dtabase/.

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Realizando o push das imagens"
docker push pedroheeger/boot015_projeto-backend:1.0
docker push pedroheeger/boot015_projeto-database:1.0

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Criando servicos no cluster Kubernetes"
kubectl apply -f ./services.yml

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Criando os deployments no cluster Kubernetes"
kubectl apply -f ./deployment.yml