#!/bin/python3
import json

with open("docker-registry.groovy", "r") as inputfile:
    filedata = inputfile.read()
    jsondata = {}
    jsondata['name'] = 'docker-registry'
    jsondata['type'] = 'groovy'
    jsondata['content'] = filedata

    with open("docker-registry.json", "w") as outputfile:
        outputfile.write(json.dumps(jsondata))