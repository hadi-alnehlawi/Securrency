docker image inspect securrency >/dev/null 2>&1 && \
        echo "image is already built" || \
        docker build -t securrency -f ./app/Dockerfile ./app
export docker_user_name="hadialnehlawi"
docker tag securrency $docker_user_name/securrency:latest
docker push $docker_user_name/securrency:latest