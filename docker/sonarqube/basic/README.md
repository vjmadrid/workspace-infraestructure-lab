# Basic Sonarqube

Esta propuesta representa una instalación básica y standalone de **Sonarqube** con **Docker**

*  Incluye el uso de una base de datos postgres:9.6-alpine





## Stack Tecnológico

* [Docker](https://www.docker.com/) - Technología de Contenedores/Containers
* [Docker Hub](https://hub.docker.com/) - Repositorio de Docker Publico
* [Sonarqube 7.9.1](https://www.sonarqube.org/) - Analizador de código
* [Postgres 9.6](https://www.postgresql.org/) - Base de datos relacional

Dependencias con Proyectos de Arquitectura

N/A

Dependecias con Terceros

N/A





## Prerrequisitos

Define que elementos son necesarios para instalar el software

* Docker installed (19+)





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

No aplica porque se monta junto a la base de datos





## Pruebas

N/A





## Despliegue

Cada propuesta tiene su propia forma





## Uso


### Uso con Browser

La URL de acceso es la siguiente :

```bash
http://localhost:9000/
```

Usuarios disponibles 

* admin/admin





## Versionado

**Nota :** [SemVer](http://semver.org/) es usado para el versionado.





## Autores

* **atSistemas**
