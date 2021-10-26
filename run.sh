export PROD="http://0.0.0.0:8090/prod.html"
export DEV="http://0.0.0.0:8090/dev.html"
docker rm -f $(docker ps -a -q) > /dev/null 2>&1
docker rmi -f $(docker images) > /dev/null 2>&1
docker build --quiet --tag sec .
docker run -it --network=host sec $PROD $DEV