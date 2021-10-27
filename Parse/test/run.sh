export production="http://0.0.0.0:8000/test/prod.html"
export dev="http://0.0.0.0:8000/test/dev.html"
docker rm -f $(docker ps -a -q) > /dev/null 2>&1
docker rmi -f $(docker images) > /dev/null 2>&1
docker build --quiet --tag parsejson .
docker run -it --network=host parsejson $production $dev