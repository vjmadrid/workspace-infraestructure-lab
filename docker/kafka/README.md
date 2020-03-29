# Basic Kafka

Esta propuesta representa una instalación básica y standalone de **Apache Kafka** con **Docker**

Se cubren diferentes instalaciones / configuraciones :

BASIC

* zk-single-kafka-single : Una instancia de Zookeeper y una instancia de un Broker Kafka
* zk-single-kafka-multiples : Una instancia de Zookeeper y varias instancias (3) de un Broker Kafka
* zk-multiple-kafka-single : Varias instancias (3) de Zookeeper y una instancia de un Broker Kafka
* zk-multiple-kafka-multiple : Varias instancias (3) de Zookeeper y varias instancias (3) de un Broker Kafka

CUSTOM


## Stack Tecnológico

* [Docker](https://www.docker.com/) - Technología de Contenedores/Containers
* [Docker Hub](https://hub.docker.com/) - Repositorio de Docker Publico
* [Zookeeper](https://zookeeper.apache.org/) - Gestor distribuido
* [Kafka](https://kafka.apache.org/) - Plataforma de Streaming distribuida

Dependencias con Proyectos de Arquitectura

N/A

Dependecias con Terceros

N/A





## Prerrequisitos

Define que elementos son necesarios para instalar el software

* Docker installed (19+)


1. Ejecutar el siguiente comando

```bash
export DOCKER_HOST_IP=127.0.0.1
```

Con ello se genera una variable de entorno con el valor por defecto

En ocasiones para Docker en Mac <=1.11 y para Windows la IP es diferente : 192.168.99.100

```bash
export DOCKER_HOST_IP=192.168.99.100
```




## Instalación

### Docker Compose

1. Localizar el directorio principal del proyecto : <PROJECT_PATH>

2. Ejecutar el siguiente comando

```bash
docker-compose up
```

3. Comprobar que la imágen ha sido creada

4. Comprobar que la aplicación ha sido desplegada correctamente




### Docker Standalone

N/A





## Pruebas

N/A





## Despliegue

Cada propuesta tiene su propia forma





## Uso


### Uso con Browser

La URL de acceso es la siguiente :

```bash
http://localhost:8090/
```

Usuarios disponibles 

* ¿?





## Versionado

**Nota :** [SemVer](http://semver.org/) es usado para el versionado.





## Autores

* **atSistemas**
