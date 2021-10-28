FROM ubuntu:latest
WORKDIR /app
COPY ./gopeople /app/gopeople
ARG DBPORT
ARG DBHOST
ARG DBUSER
ARG DBPASS
EXPOSE 8080
ENTRYPOINT  [ "./gopeople" ]
