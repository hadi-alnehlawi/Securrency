from urllib.request import urlopen
import json

# store the URL in url as 
# parameter for urlopen
url1 = "https://horizon-testnet.stellar.org"

def parse_url(url):
    # store the response of URL
    response = urlopen(url)
    
    # storing the JSON response 
    # from url in data
    data_json1 = json.loads(response.read())
    
    # print the json response
    for key in data_json.keys():
        if key == "core_version":
            print(data_json[key])