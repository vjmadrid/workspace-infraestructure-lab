FROM python:3.6.9-slim

WORKDIR /opt

# Copy scripts
COPY ./script/provision.sh .
COPY ./script/security.groovy .
COPY ./utils .

# Install dependecies
RUN apt-get update -y
RUN apt-get install curl -y

# Run scripts
RUN python json-converter.py
