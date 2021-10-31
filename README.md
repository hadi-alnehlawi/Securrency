# Securrency

## Parse JSON File ##
`$ cd ./Parse`

Parsing the online json file is executed by a python application `app.py` which takes two input arguments: PROD_URL & DEV_URL. The app will be running continuesly and catch any change in the key of the json and response.
#### Desgin ####
```
# python > 2.7
$ export production="https://horizon.stellar.org"
$ export dev="https://horizon-testnet.stellar.org"
$ python app_name.py $production $dev
```
1. Check the number of the arguments passed to the python script, if it was 3 then is ok. ex. Otherwise print an error message.
2. Iterate over the arguments skipping the first item which is the 'python' word. If the argvs are valid urls then parse them. Otherwise, raise an exception.
3. The urls must have a key `core_version` and raise an excemption when it is not existed.
4. Compare the two versions and send an alter `OK` if they are not the same.
#### Deploy ####
We need to track the version continuosly and trigger the alter accordingly. In order achieve this goal, the application is deployed as a Docker container and is always running as a single process.
```
# environment variables: production & dev contain the target json files
$ docker build --quiet --tag parsejson .
$ docker run -it --network=host parsejson $production $dev

```
1. Build the docker image with a tag `parsejson`
2. Run the docker image and pass the two arguments url: `production` & `dev`
3. If the two arguemnts are NOT the same, it would sned an alter stdout `OK`. In other case, it would do nothing
#### Testing ####
There is an additional option to test this locally and manipulate with the json file. Two local json files `dev.html` & `prod.html` are the same of production & dev of horizon resepctively. We can these file by running a demo httpsever and then change the content of prod or dev files to reflect the change and see the result
```
# run the below commands in two seperate shells
sh ./test/httpserver.sh
sh ./test/run.sh
```


## Migrate ##
We need to run and deploy a [web applicaiton](https://github.com/komarserjio/notejam/tree/master/flask) connected to postgresdb on kubernetes cluser [minikube](https://minikube.sigs.k8s.io/docs/start/).

### Build ###
It is required to build the applicaiton first - named as `goeople`. Therefore, the applicaiton was dockerized into a contianer and pushed to [DockerHub](https://hub.docker.com/) container registery. Therefore, the blow three steps are **optional** and might be **skipped** as the images are already built and pushed
1. Login to docker hub regitery.
2. Run the shell to build docker image and push.
3. I used my public docker hub for an ease installation, please feel free to use any public contianer registery.
```
$ echo $docker_user_name=my_username
$ echo $my_passowrd docker -U $docker_user_name --password-stdin
$ sh Migrate/run-ci.sh
```
### Deploy ###
The deployment steps are packaged in one file

`$ sh Migrate/run-cd.sh`
#### Steps ####
Start the minikube cluster and enable ingress.
```
$ minikube start
$ minikube addons enable ingress
```
Create a namespace `gopeople` and set it as default.
```
$ kubectl create namespace securrency
$ kubectl config set-context --current --namespace=gopeople
```
Set TLS Certifiate locally which is going to be used for HTTPs.
```
$ openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout tls.key -out tls.crt -subj "/CN=gopeople.com" -days 365
```
Update the helm chart to deploy all the services. Also save the created tls and the certification as a secret in the cluster.
```
$ helm upgrade gopeople Migrate/deploy/gopeople
$ kubectl create secret tls gopeople-com-tls --cert=tls.crt --key=tls.key
```

 We need to wait couple of seconds till all the containers are pulled and running succesfully. 

```
$ kubectl get pods
```

check the applicaiton by logging to the HTTPs site:
**https://gopeople.com/**

#### Clean up ####
```
$ # delete the whole namespace
$ kubectl delete namespace gopeople
$ # or destroy all resources on cluster
$ kubectl delete all --all
```
