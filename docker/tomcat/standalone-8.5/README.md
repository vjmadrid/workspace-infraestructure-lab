# acme-tomcat-standalone-8.5

This project represents a basic and standalone installation of **Tomcat** with **Docker**

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

N/A

## Testing

N/A

## Deploy

1. Execute the following command

Create a Docker image File

```bash
docker build -t acme/acme-tomcat-standalone-8.5 .
```

2. Verify exist image created

3. Execute the following command

Create a Docker container

```bash
docker run -p 8888:8080 -t acme/acme-tomcat-standalone-8.5
```

## Use

N/A

### Use Browser

The service will accept HTTP GET requests at :

```bash
http://localhost:8888/
```

And login with : admin/admin


## Versioning

**Note :** [SemVer](http://semver.org/) is used for the versioning.
To see the available versions access the repository tags

## Authors

* **Víctor Madrid**
