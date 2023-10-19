import os
import yaml

def parse_yaml(filename):
    """This function will parse the yaml file and return the object
       :param filename: the yaml file to be parsed
    """
    try:
        print("cwd is {}".format(os.getcwd()))
        a_yaml_file = open(filename, encoding="utf8")
        yaml_parsed = yaml.load(a_yaml_file, Loader=yaml.FullLoader)
        return(yaml_parsed)
        #print(api_params)
    except Exception as err:
        print(str(err))
        return (str(err))