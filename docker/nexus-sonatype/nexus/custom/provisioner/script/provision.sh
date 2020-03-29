#!/usr/bin/env bash

# Configuration
NEXUS_USERNAME=admin
NEXUS_PASSWORD=`cat /data/admin.password`

NEXUS_HOST=http://nexus:8081

# Provisioning
printf "\n[INIT] Provisioning Integration API Scripts...\n"

# *** Security ***
echo "Upload Security Groovy script"
curl -v -X POST -u $NEXUS_USERNAME:$NEXUS_PASSWORD --header "Content-Type: application/json" "$NEXUS_HOST/service/rest/v1/script" -d @/opt/security.json

echo "Execute Security Groovy script"
curl -v -X POST -u $NEXUS_USERNAME:$NEXUS_PASSWORD  --header "Content-Type: text/plain" "$NEXUS_HOST/service/rest/v1/script/security/run"

printf "\n[END] Provisioning Scripts Completed\n\n"
