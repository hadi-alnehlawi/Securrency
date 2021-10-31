# I used my public docker hub for an ease installation 
# please feel free to use any public contianer registery

# export app=securrency
export app=gopeople
docker image inspect $app >/dev/null 2>&1 && \
        echo "image is already built" || \
        docker build -t $app -f ./$app/Dockerfile ./$app
export docker_user_name="hadialnehlawi"
docker tag $app $docker_user_name/$app:latest
docker push $docker_user_name/$app:latest