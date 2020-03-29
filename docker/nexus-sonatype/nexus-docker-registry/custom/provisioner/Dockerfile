FROM python:3.6.9-slim

WORKDIR /opt

# Copy scripts
COPY ./script-custom/provision.sh .
COPY ./script-custom/custom.groovy .

#COPY ./script/security.groovy .
#COPY ./script/docker-registry.groovy .

COPY ./utils/ .

# Install dependecies
RUN apt-get update -y
RUN apt-get install curl -y

# Run scripts
RUN python json-converter-custom.py

#RUN python json-converter-security.py
#RUN python json-converter-docker-registry.py


