#!/usr/bin/env bash

# Global Configuration
NEXUS_USERNAME=admin
NEXUS_PASSWORD=`cat /data/admin.password`

NEXUS_HOST=http://nexus:8081

# Script configuration (name used in jsondata['name'] int json-converter.py)
SECURITY_NAME_SCRIPT='security'
DOCKER_REGISTRY_NAME_SCRIPT='docker-registry'

# Provisioning
printf "\n[INIT] Provisioning Integration API Scripts...\n"

# *** Security ***
echo "\n****************"
echo "\n*** Security ***"
echo "\n****************"

echo "Upload Security Groovy script"
curl -v -X POST -u $NEXUS_USERNAME:$NEXUS_PASSWORD --header "Content-Type: application/json" "$NEXUS_HOST/service/rest/v1/script" -d @/opt/security.json

echo "Execute Security Groovy script"
curl -v -X POST -u $NEXUS_USERNAME:$NEXUS_PASSWORD  --header "Content-Type: text/plain" "$NEXUS_HOST/service/rest/v1/script/$SECURITY_NAME_SCRIPT/run"

# *** Docker Registry ***
echo "\n***********************"
echo "\n*** Docker Registry ***"
echo "\n***********************"

echo "Upload Docker Registry Groovy script"
curl -v -X POST -u $NEXUS_USERNAME:$NEXUS_PASSWORD --header "Content-Type: application/json" "$NEXUS_HOST/service/rest/v1/script" -d @/opt/docker-registry.json

echo "Execute Docker Registry Groovy script"
curl -v -X POST -u $NEXUS_USERNAME:$NEXUS_PASSWORD  --header "Content-Type: text/plain" "$NEXUS_HOST/service/rest/v1/script/$DOCKER_REGISTRY_NAME_SCRIPT/run"

printf "\n[END] Provisioning Scripts Completed\n\n"

