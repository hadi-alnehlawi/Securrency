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
2. Iterate over the arguments skipping the first item which is the 'python' word. If the argvs are valid urls then parse them. Otherwise, raise an exception.
3. The urls must have a key `core_version` and raise an excemption when it is not existed.
4. Compare the two versions and send the an alter `OK` if they are not the same.
### Deploy ###
We need to track the version continuosly and trigger the alter accordingly. In order achieve this goal, the application is deployed as a Docker container and is always running as a single process.
```
# environment variables: production & dev contain the target json files
$ docker build --quiet --tag parsejson .
$ docker run -it --network=host parsejson $production $dev

```
1. Build the docker image with a tag `parsejson`
2. Run the docker image and pass the two arguments url: `production` & `dev`
3. If the two arguemnts are NOT the same, it would sned an alter stdout `OK`. In other case, it would do nothing.