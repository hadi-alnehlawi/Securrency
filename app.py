from urllib.request import urlopen
import json
import sys




# store the URL in url as 
# parameter for urlopen
url1 = "https://horizon-testnet.stellar.org"
url2 =  "https://horizon-testnet.stellar.org"


def get_arguemnts():
    '''
    * check the numebr of arguments passed to the python script
    * if it was 3 then is ok. ex. python app_name.py arg1 arg2
    * however print an error message
    '''
    argv_num = len(sys.argv)
    if argv_num != 3:
        print("wrong arguments number...!!")
        return False
    else:
        return True

def parse_url(url):
    # store the response of URL
    response = urlopen(url)
    
    # storing the JSON response 
    # from url in data
    data_json = json.loads(response.read())
    
    # print the json response
    for key in data_json.keys():
        if key == "core_version":
            return data_json["core_version"]


def main():
    if get_arguemnts():
        parse_url(url1)

main()