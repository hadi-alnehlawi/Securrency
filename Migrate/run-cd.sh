# Deploy Folder ENV
export DEPLOPY_FOLDER="./deploy"

# Create K8S PVC
# kubectl apply -f $DEPLOPY_FOLDER/pvc/postgres-pv.yaml;
# kubectl apply -f $DEPLOPY_FOLDER/pvc/postgres-pvc.yaml;
# kubectl apply -f $DEPLOPY_FOLDER/configmap/postgres-conf.yaml;

# Set ENV Varaiables
export DBHELM=postgresqldb;
export DBPVC=pgpvc;
export DBSQL=pgmigrate;
export DBPORT=5432;
export DBHOST=localhost;
export DBUSER=postgres;
export DBPASS=postgres;
export DBNAME=postgres;
export DBTAG=10.18.0-debian-10-r74;

# # Install HELM Postgres
# helm install ${DBHELM} bitnami/postgresql \
#     --set persistence.existingClaim=$DBPVC \
#     --set volumePermissions.enabled=true \
#     --set postgresqlDatabase=$DBNAME \
#     --set initdbScriptsConfigMap=$DBSQL \
#     --set image.tag=$DBTAG \
#     --set postgresqlPassword=$DBPASS \
#     --set postgresqlUsername=$DBUSER;

# export POSTGRES_PASSWORD=$(kubectl get secret --namespace default $DBHELM -o jsonpath="{.data.postgresql-password}" | base64 --decode);
# kubectl port-forward svc/${DBHELM} 5432:5432;
# PGPASSWORD="$DBPASS" psql --host localhost -U postgres -d postgres -p 5432;

# Deploy notejam app
kubectl apply -f $DEPLOPY_FOLDER/deployment/notejam-deployement.yaml 

# kubectl apply -f migration-pvc.yaml
# kubectl apply -f people-database-pvc.yaml
# kubectl apply -f people-database-deployment.yaml
# kubectl apply -f people_database-service.yaml
# kubectl apply -f migration-pod.yaml
# kubectl apply -f people-api-deployment.yaml
# kubectl apply -f people_api-service.yaml


# kubectl delete -f people-database-deployment.yaml
# kubectl delete -f people_database-service.yaml
# kubectl delete -f migration-pod.yaml
# kubectl delete -f people-api-deployment.yaml
# kubectl delete -f people_api-service.yaml
# kubectl delete -f migration-pvc.yaml
# kubectl delete -f people-database-pvc.yaml