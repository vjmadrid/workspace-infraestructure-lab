# Tomcat

This project represents a basic and standalone installation of **Tomcat** with **Docker**

Different installations/configurations are covered:

BASIC




## Technological Stack

* [Docker](https://www.docker.com/) - Container Technology
* [Docker Hub](https://hub.docker.com/) - Docker Public repository
* [Tomcat 8.5](http://tomcat.apache.org) : Servlet Container

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
docker-compose up
```

3. Check that the image has been loaded

4. Check that the application is deployed correctly





### Docker Standalone

1. Locate the Dockerfile directory of the project : <PROJECT_PATH>/<CORE>

2. Execute the following command

Create a Docker image File

```bash
docker build -t acme/basic-tomcat-standalone-8.5 .
```

3. Check that the image has been loaded

4. Execute the following command

Create a Docker container

```bash
docker run -p 8888:8080 -t acme/basic-tomcat-standalone-8.5
```

5. Check that the container is created correctly





## Testing

N/A





## Use


### Use Browser

The service will accept HTTP GET requests at :

```bash
http://localhost:8888/
```

Login with user : admin/admin





## Versioning

**Note :** [SemVer](http://semver.org/) is used for the versioning.
To see the available versions access the repository tags





## Authors

* **Víctor Madrid**
