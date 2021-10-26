# start from base
FROM python:3.8.10
LABEL maintainer="HADI ALNEHLAWI nhadi82@hotmail.com"
WORKDIR /app
COPY ./app.py /app/app.py
ENV PROD_URL=$PROD_URL
ENV DEV_URL=$PROD_URL
RUN [-z "PROD_URL"] && [-z "DEV_URL"] || exit 0
CMD ["python" , "app.py" , "$PROD_URL" ,"$DEV_URL"]
