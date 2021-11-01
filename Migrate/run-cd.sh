# Set Environments Variables
export MOUNTPVC=$(pwd)/Migrate/deploy/gopeople/volumes

# Minikube Cluster
minikube start --mount --mount-string="$MOUNTPVC:/mountvpc"

# Minikube Ingree Enable
minikube addons enable ingress

# Resolve DNS Locally
echo "$(minikube ip) gopeople.com" | sudo tee -a /etc/hosts

# Create K8S Namespace
kubectl create namespace gopeople
kubectl config set-context --current --namespace=gopeople

# TLS Certifiate Loally
openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout $MOUNTPVC/tls.key -out $MOUNTPVC/tls.crt -subj "/CN=gopeople.com" -days 365

# Helm Charts Apply
kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission
helm install gopeople Migrate/deploy/gopeople
kubectl create secret tls gopeople-com-tls --cert=$MOUNTPVC/tls.crt --key=$MOUNTPVC/tls.key

# Running
# wait till all the pods are created by checking
kubectl get pods

# Clean Up
# mikine delete
# # or
# kubectl delete namespace gopeople