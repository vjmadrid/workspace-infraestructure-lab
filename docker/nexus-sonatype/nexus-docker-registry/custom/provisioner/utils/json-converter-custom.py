#!/bin/python3
import json

with open("custom.groovy", "r") as inputfile:
    filedata = inputfile.read()
    jsondata = {}
    jsondata['name'] = 'custom'
    jsondata['type'] = 'groovy'
    jsondata['content'] = filedata

    with open("custom.json", "w") as outputfile:
        outputfile.write(json.dumps(jsondata))