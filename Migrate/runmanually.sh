docker rmi -f gopeople
docker build --tag gopeople .
# docker run -d --network host --env-file=gopeople.env gopeople