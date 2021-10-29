# start from base
FROM python:3.8.10
LABEL maintainer="HADI ALNEHLAWI nhadi82@hotmail.com"
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN python --version
RUN pip install -r requirements.txt
COPY . /app
ENV DBHOST=$DBHOST
ENV DBUSER=$DBUSER
ENV DBPASS=$DBPASS
ENV DBNAME=$DBNAME
ENV DBPORT=$DBPORT

ENV DATABASE_URI="postgres://$DBUSER:$DBPASS@$DBHOST:$DBPORT/$DBNAME"
EXPOSE 5000
CMD ["python", "app.py" ]