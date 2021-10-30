# # Minikube Cluster
# minikube start
# kubectl create namespace securrency
# kubectl config set-context --current --namespace=securrency

## Helm Chart 
# cd Migration/deploy
# helm create securrency Migration/deploy

## Helm Update & Migration
# cd Migrate/deploy
# helm install securrency Migrate/deploy/securrency
# POD=$(kubectl get pod -l app=securrency -o jsonpath="{.items[0].metadata.name}")
# kubectl exec -it $POD -- sh /app/migrate.sh
