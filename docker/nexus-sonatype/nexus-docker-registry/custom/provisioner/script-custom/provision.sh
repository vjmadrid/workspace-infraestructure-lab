#!/usr/bin/env bash

# Global Configuration
NEXUS_USERNAME=admin
NEXUS_PASSWORD=`cat /data/admin.password`

NEXUS_HOST=http://nexus:8081

# Script configuration (name used in jsondata['name'] int json-converter.py)
CUSTOM_NAME_SCRIPT='custom'

# Provisioning
printf "\n[INIT] Provisioning Integration API Scripts...\n"

# *** Custom ***
echo "\n****************"
echo "\n*** Custom   ***"
echo "\n****************"

echo "Upload Custom Groovy script"
curl -v -X POST -u $NEXUS_USERNAME:$NEXUS_PASSWORD --header "Content-Type: application/json" "$NEXUS_HOST/service/rest/v1/script" -d @/opt/custom.json

echo "Execute Custom Groovy script"
curl -v -X POST -u $NEXUS_USERNAME:$NEXUS_PASSWORD  --header "Content-Type: text/plain" "$NEXUS_HOST/service/rest/v1/script/$CUSTOM_NAME_SCRIPT/run"

printf "\n[END] Provisioning Scripts Completed\n\n"

