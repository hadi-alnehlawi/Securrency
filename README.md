# Securrency

## Parse JSON File ##
Parsing the online json file is executed by a python application `app.py` which takes two input arguments: PROD_URL & DEV_URL.
### Desgin ###
```
# python > 2.7
$ export production="https://horizon.stellar.org"
$ export dev="https://horizon-testnet.stellar.org"
$ python app_name.py $production $dev
```
1. Check the number of the arguments passed to the python script, if it was 3 then is ok. ex. Otherwise print an error message.
2. iterate over the arguments list skipping the first item which is 'python' wor. If the passed argvs are valid url then parse them. Otherwise, raise an exception.
3. Compare the two versions and send the an alter "OK" if they are not the same.
### Deploy ###
We need to track the version continuosly and trigget the alter accordingly. In toder to achieve this goal, the application is deployed as Docker container which is always running a single process
```
$ docker build --quiet --tag parsejson .
$ docker run -it --network=host parsejson $production $dev
```
1. Build the docker images with a tag parsejson
2. Run the docker 