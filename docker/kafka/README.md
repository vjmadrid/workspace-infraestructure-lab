# Kafka

This proposal represents a basic and standalone installation of **Apache Kafka** with **Docker**

Different installations/configurations are covered:

BASIC

* zk-single-kafka-single : One instance of Zookeeper and one instance of Kafka Broker
* zk-single-kafka-multiples : One instance of Zookeeper and several instances (3) of a Kafka Broker
* zk-multiple-kafka-single : Several instances (3) of Zookeeper and one instance of a Kafka Broker
* zk-multiple-kafka-multiple : Several instances (3) of Zookeeper and several instances (3) of a Kafka Broker

CUSTOM

It will be shown how to add extra applications (monitoring, control, etc.).





## Technological Stack

* [Docker](https://www.docker.com/) - Container Technology
* [Docker Hub](https://hub.docker.com/) - Docker Public repository
* [Zookeeper](https://zookeeper.apache.org/) - Gestor distribuido
* [Kafka](https://kafka.apache.org/) - Plataforma de Streaming distribuida

Dependencies with architecture projects

N/A

Third Party Dependencies

N/A





## Prerequisites

Define what elements are needed to install the software

* Docker installed (19+)





## Installation

1. Execute the following command

```bash
export DOCKER_HOST_IP=127.0.0.1
```

This generates an environment variable with the default value

Sometimes for Docker on Mac <=1.11 and for Windows the IP is different : 192.168.99.100

```bash
export DOCKER_HOST_IP=192.168.99.100
```

### Docker Compose

1. Locate the main directory of the project : <PROJECT_PATH>

2. Execute the following command

```bash
docker-compose -f <file> up
```

3. Check that the image has been loaded

4. Check that the application is deployed correctly





### Docker Standalone

N/A





## Testing

N/A





## Deploy

N/A





## Use

With Kafka development app





## Versioning

**Note :** [SemVer](http://semver.org/) is used for the versioning





## Authors

* **Víctor Madrid**
