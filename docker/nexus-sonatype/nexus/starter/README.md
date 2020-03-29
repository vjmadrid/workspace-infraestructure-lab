# Starter Nexus

Esta propuesta representa una instalación básica y standalone de **Nexus** con **Docker**





## Stack Tecnológico

* [Docker](https://www.docker.com/) - Technología de Contenedores/Containers
* [Docker Hub](https://hub.docker.com/) - Repositorio de Docker Publico
* [Nexus Sonatype OSS 3.20.1](https://www.sonatype.com/nexus-repository-oss) - Repositorio de artefactos

Dependencias con Proyectos de Arquitectura

N/A

Dependecias con Terceros

N/A





## Prerrequisitos

Define que elementos son necesarios para instalar el software

* Docker installed (19+)





## Instalación

### Docker Compose

N/A




### Docker Standalone

1. Localizar el directorio Dockerfile del proyecto : <PROJECT_PATH>/<CORE>

2. Ejecutar el siguiente comando

Crear un fichero Docker image

```bash
docker run --rm -p 8100:8081 --name nexus sonatype/nexus3
```

3. Comprobar que la imagen ha sido cargada como container

4. Verificar que esta disponible la consola web

4. Obtener la password de admin generada por el contenedor

```bash
docker ps -a

docker exec -it ID_CONTAINER sh

cat /nexus-data/admin.password
```

5. Probar la password en la consola web

6. Cambiar password desde consola por : admin123

7. Activar el acceso anonimo

8. Probar logout y login con la nueva password

9. Ejecutar el script de aprovisionamiento

Se requiere tener instalada en la maquina groovy

```bash
sh provision.sh
```

10. Veririficar la ejecución en la consola

11. Verificar los cambios enla consola web





## Pruebas

N/A





## Despliegue

Cada propuesta tiene su propia forma





## Uso


### Uso con Browser

La URL de acceso es la siguiente :

```bash
http://localhost:8100/
```

Usuarios disponibles 

* Inicialmente admin/ la password generada por el container
* admin/admin123





## Versionado

**Nota :** [SemVer](http://semver.org/) es usado para el versionado.





## Autores

* **atSistemas**
