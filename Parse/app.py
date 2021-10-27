from urllib.request import urlopen
from urllib.error import HTTPError
import json, sys, time

def check_args():
    '''
    * check the number of arguments passed to the python script
    * if it was 3 then is ok. ex. python app_name.py arg1 arg2
    * however print an error message
    '''
    argv_num = len(sys.argv)
    if argv_num != 3:
        return False
    else:
        return True

def parse_url(*argv):
    '''
    * iterate over the arguments list skipping the first item which is 'python' word
    * if the passed argvs are valid url then parse them, otherwise raise an exception
    '''
    versions = set()
    data_jsons = []
    for arg in list(*argv)[1:]:
        try:
            response = urlopen(arg)
            # storing the JSON response from url in data
            data_jsons.append(json.loads(response.read()))
        except  (HTTPError):
            print(f"{arg}")
            return False
    return data_jsons

def check_core_version(data_jsons, key):
    '''
    look in the json and check if the key (in our case 'core_version') is a valid key
    '''
    for data_json in data_jsons:
        if not key in data_json:
            return False
    return True

def compare_version(data_jsons, key):
    '''
    * OK: compare the version set if it contains more than one item, it means all version are not same
    * NOT OK: the set has one item (version) then it is not OK
    '''
    versions = set()
    for data_json in data_jsons:
        versions.add(data_json[key])
    if len(versions) != 1 :
        # versions are NOT the same
        print("OK")
    else:
        return

def main(key):
    # (1) check arguments
    if check_args():
        while True:
            data_jsons = parse_url(sys.argv)
           # (2) check we have a valid json
            if data_jsons:
                # (3) check if the key is a valid key in the parsed json
                if check_core_version(data_jsons, key):
                    # (4) do the comparision between the two versions
                    data_jsons = parse_url(sys.argv)
                    compare_version(data_jsons, key)
                    time.sleep(1)
                else:
                    print("core_version is not a valid key..!!")
                    return
        else:
            print("This argument is not a valid url..!!")
            return
    else:
        print("wrong arguments number...!!")
        return

# main application 
main(key="core_version")
