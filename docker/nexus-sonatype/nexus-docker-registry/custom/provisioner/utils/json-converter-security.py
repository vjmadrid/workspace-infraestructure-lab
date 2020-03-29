#!/bin/python3
import json

with open("security.groovy", "r") as inputfile:
    filedata = inputfile.read()
    jsondata = {}
    jsondata['name'] = 'security'
    jsondata['type'] = 'groovy'
    jsondata['content'] = filedata

    with open("security.json", "w") as outputfile:
        outputfile.write(json.dumps(jsondata))