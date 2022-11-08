echo "Criando as imagens........."

docker build -t keilertrindade/projeto-backend:1.0 backend/.
docker build -t keilertrindade/projeto-database:1.0 database/.

echo "Realizando o push das imagens........."

docker push keilertrindade/projeto-backend:1.0
docker push keilertrindade/projeto-database:1.0

echo "Criando serviços do cluster Kubernets........."

kubectl apply -f ./services.yml

echo "Criando deployments do cluster Kubernets........."

kubectl apply -f ./deployment.yml
