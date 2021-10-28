FROM alpine:latest
WORKDIR /app
# COPY ./migrations/1_create_tables.up.sql /docker-entrypoint-initdb.d/init.sql
ADD ./gopeople /app/gopeople
ADD ./static /app/static
ADD ./main.go /app/main.go
ADD ./personHandler.go /app/personHandler.go
ADD ./store.go /app/store.go
ADD ./vendor /app/vendor
ARG DBPORT
ARG DBHOST
ARG DBUSER
ARG DBPASS
RUN chmod 775 gopeople
RUN apk add --no-cache git make musl-dev go
RUN go get -u github.com/gorilla/mux
RUN go get -u github.com/lib/pq
EXPOSE 8080
# ENTRYPOINT [ "./" ]
