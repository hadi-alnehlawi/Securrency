## GoWeb-PostgreSQL

Based on project [GoWeb-PostgreSQL](https://adaickalavan.github.io/portfolio/golang-web-application-with-postgresql/)

This application is written in Golang + HTML + JS

We use it with Terraform code for some Workshops, Meetups, Labs, etc.

#### How to use it

Here is a list of variables which you need to be add to env variables:

export DBPORT= "Your DB Port"

export DBHOST= "Your DB Host"

export DBUSER= "Your DB user"

export DBPASS= "Your DB Password"

export DBNAME= "Your DB Name"

#### Additional info

You can check the server where the application runs on using http:/yourIP/server endpoint 

#### Download and install
```
$ curl -L https://github.com/s-marchenko/postgresql-go/releases/download/v1.0.0/website_linux_amd64 --output postgresql
$ chmod 775 postgresql


panic: pq: unknown authentication response: 10

goroutine 1 [running]:
main.initDb()
        /Users/sergii.marchenko/go/src/github.com/s-marchenko/postgresql-go/code/main.go:60 +0x3b7
main.main()
        /Users/sergii.marchenko/go/src/github.com/s-marchenko/postgresql-go/code/main.go:99 +0x26

It is worth mentioning that the task itself is straightforward and easy to achiever. However, the build version is not going though. I tried simple Go Hello Applicaiton just to assure my GO env is working expertly. 

```