export production="http://0.0.0.0:8000/Parse/test/prod.html"
export dev="http://0.0.0.0:8000/Parse/test/dev.html"
docker rm -f $(docker ps -a -q) > /dev/null 2>&1
docker rmi -f $(docker images) > /dev/null 2>&1
docker build --tag parsejson -f Parse/Dockerfile Parse/
docker run -it --network=host parsejson $production $dev