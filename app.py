from urllib.request import urlopen
import json, sys

def check_args():
    '''
    * check the numebr of arguments passed to the python script
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
    for arg in list(*argv)[1:]:
        try:
            response = urlopen(arg)
            # storing the JSON response from url in data
            data_json = json.loads(response.read())
            for key in data_json.keys():
                if key == "core_version":
                    try:
                        versions.add(data_json[key])
                    except KeyError:
                        print("core_version is not a valid key in the json url file")
        except ValueError:
            print(f"The argument {arg} is not a valid url..!!")
    return versions

def compare_version(versions):
    '''
    * OK: compare the version set if it contains more than one item, it means all version are not same
    * NOT OK: the set has one item (version) then it is not OK
    '''
    if len(versions) != 1:
        print("OK: versions are NOT the same")
    else:
        print("NOT OK: same versions")

def main():
    if check_args():
        core_versions = parse_url(sys.argv)
        compare_version(core_versions)
    else:
        print("wrong arguments number...!!")

# applicaiton main body
main()