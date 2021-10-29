# start from base
FROM python:3.8.10
LABEL maintainer="HADI ALNEHLAWI nhadi82@hotmail.com"
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN python --version
RUN pip install -r requirements.txt
COPY . /app
ENV DBHOST=localhost
ENV DBUSER=postgres
ENV DBPASS=postgres
ENV DBNAME=postgres
ENV DBPORT=5432

ENV DATABASE_URI="postgres://$DBUSER:$DBPASS@$DBHOST:$DBPORT/$DBNAME"
EXPOSE 5000
CMD ["sh", "./entrypoint.sh" ]