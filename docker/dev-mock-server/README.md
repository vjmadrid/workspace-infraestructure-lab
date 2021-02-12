# dev-mock-server

This proposal represents a tool to be able to **mount** fast **testing environments** with the objective of being able to test integrations : between applications, between infrastructure, both, etc.

Different installations/configurations are covered:

**dev-server-local**

Mount docker containers with different API display allowing the boot with own or external configuration files

* Each microservice generates an embedded h2 database that simulates the behavior od the real database

Note: applications will use memory resources

**dev-mock-server-with-infra-embedded**

xxx

**dev-mock-server-with-infra-external**

xxx





## Technological Stack

* [Docker](https://www.docker.com/) - Container Technology
* [Docker Hub](https://hub.docker.com/) - Docker Public repository
* Java 8
* [Maven 3](https://maven.apache.org/) - Gestión de Dependencias
* [Spring Boot](https://spring.io/projects/spring-boot) - 2.2.0.RELEASE
* [Spring](https://spring.io)

Dependencies with architecture projects

N/A

Third Party Dependencies

N/A





## Prerequisites

Define what elements are needed to install the software

* Docker installed (19+)





## Installation


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

* Access with Post,am Client
* Access Swagger




## Versioning

**Note :** [SemVer](http://semver.org/) is used for the versioning





## Authors

* **Víctor Madrid**
