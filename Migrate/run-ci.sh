docker image inspect notejam >/dev/null 2>&1 && \
        echo "image is already built" || \
        docker build -t notejam -f ./app/Dockerfile ./app
export docker_user_name="hadialnehlawi"
docker tag notejam $docker_user_name/notejam:latest
docker push $docker_user_name/notejam:latest
# docker run -it  --network host -p 5000  notejam