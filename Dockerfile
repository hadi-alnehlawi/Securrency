# start from base
FROM python:3.8.10-slim
LABEL maintainer="HADI ALNEHLAWI nhadi82@hotmail.com"
WORKDIR /app
COPY ./app.py /app/app.py
ENV PROD_URL="https://horizon.stellar.org"
ENV DEV_URL="http://horizon-testnet.stellar.org"
ENTRYPOINT [ "python" , "app.py" ]
