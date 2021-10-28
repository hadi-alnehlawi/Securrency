docker rmi -f gopeople
docker build --tag gopeople .
docker  run -it --network host --env-file=gopeople.env  gopeople