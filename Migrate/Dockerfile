FROM ubuntu:latest
WORKDIR /app
# COPY ./migrations/1_create_tables.up.sql /docker-entrypoint-initdb.d/init.sql
COPY . .
ARG DBPORT
ARG DBHOST
ARG DBUSER
ARG DBPASS
# RUN apk add --no-cache bash
ENTRYPOINT [ "./gopeople" ]

# FROM ubuntu:latest
# FROM golang:latest



# ARG DBHOST
# ARG DBUSER
# ARG DBPASS

# WORKDIR /app
# COPY . /app/

# RUN go get -u github.com/lib/pq
# RUN go get -u github.com/gorilla/mux
# ENTRYPOINT [ "go", "run", "main.go" , "personHandler.go" , "store.go"]

# CMD [ "/app/gopeople" ]

# FROM golang:latest

# WORKDIR /go/src/app
# COPY . .

# ARG DBPORT
# ARG DBHOST
# ARG DBUSER
# ARG DBPASS

# RUN go get -u github.com/lib/pq
# RUN go get -u github.com/gorilla/mux

# CMD ["go", "build"]