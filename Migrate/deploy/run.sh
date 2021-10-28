kubectl apply -f ./pvc/postgres-pv.yaml;
kubectl apply -f ./pvc/postgres-pvc.yaml;
kubectl apply -f ./configmap/postgres-sql.yaml;
export DBHELM=postgresqldb;
export DBPVC=pgpvc;
export DBSQL=pgmigrate;
export DBPORT=5432;
export DBHOST=localhost;
export DBUSER=postgres;
export DBPASS=postgres;
export DBNAME=postgres;
export DBTAG=14.0.0-debian-10-r5;
helm install ${DBHELM} bitnami/postgresql \
    --set persistence.existingClaim=$DBPVC \
    --set volumePermissions.enabled=true \
    --set postgresqlDatabase=$DBNAME \
    --set initdbScriptsConfigMap=$DBSQL \
    --set image.tag=$DBTAG \
    --set postgresqlPassword=$DBPASS \
    --set postgresqlUsername=$DBUSER;

# export POSTGRES_PASSWORD=$(kubectl get secret --namespace default $DBHELM -o jsonpath="{.data.postgresql-password}" | base64 --decode);
# kubectl port-forward svc/${DBHELM} 5432:5432;
# PGPASSWORD="$DBPASS" psql --host localhost -U postgres -d postgres -p 5432;

