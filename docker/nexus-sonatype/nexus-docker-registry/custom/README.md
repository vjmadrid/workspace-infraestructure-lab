# Custom Nexus Docker Registry

Esta propuesta representa una instalación custom de **Nexus con Docker Registry** con **Docker**

Para ello se hará uso del API REST de aprovisionamiento que proporciona Nexus desde el podremos
"inyectar" (invocar o subir) diferentes scripts que permitirán establecer determinadas configuraciones. Con ello se facilitarán cosas como la automaticación, rehacer la configuración en cada carga, etc.

El scripting de seguridad facilitado se encargara de :

* Aplicar cambios en la configuración global
* Cambiar la password del usuario admin creado por defecto por el container de docker por una más sencilla
* Añadir un usuario corporativo atsistemas tambien con rol "admin"

El scripting de docker-registru facilitado se encargara de :

* Añadir repositorio hosted para Docker donde se guardarán nuestras imágenes
* Añadir repositorio proxy para Docker apuntando a Docker Hub
* Añadir repositorio group para Docker para proporcionar todos los repositorios desde una única URL


Se creará un container extra "provisioner" python donde se hará el trabajo intermedio para facilitar el JSON a Nexus

* **provisioner/Dockerfile** : Fichero de creación del contenedor de soporte
* **provisioner/script/security.groovy** : Script Groovy con la configuración de seguridad para Nexus
* **provisioner/script/docker-registry.groovy** : Script Groovy con la configuración de los repositorios para soporte de Docker
* **provisioner/utils/json-converter.py** : Script Python que proporciona la utilidad de convertir un script Groovy en JSON
* **provisioner/script/provision.sh** : Script Shell que invoca mediante cURL al API de Nexus y le proporciona la conversión del Script en JSON
* **provisioner/utils/wait-for-it.sh** : Script Shell que permite determinar la situacion de disponibilidad 

Consejos :

* Se aconseja crear un nuevo blob store por cada nuevo repos que se vaya a crear
* Los datos de cada repositorio deberían ubicarse en un directorio diferentes dentro de /nexus-data dentro del contenedor


Hay que considerar que normalmente el cliente Docker se comunica con los respositorios con HTTPS, para esta caso concreto el script de docker-registry se configura con HTTP (y NO HTTPS este facilita no tener que disponer y configurar el certificado necesarios)

Por otro lado se van a trabajar con 2 puertos concretos :

* 8082 : Permite hacer pull o descargar desde el repositorio proxy
* 8083 : Permite hacer pull y push sobre el respositorio privado

Dependiendo de la imagen utilizada los ficheros de configuración propios de la herramienta pueden encontrarse en diferentes ubicaciones 

Por ejemplo :

* /opt/sonatype/nexus/conf/nexus.properties
* /nexus-data/etc/nexus.properties





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

1. Localizar el directorio principal del proyecto : <PROJECT_PATH>

2. Ejecutar el siguiente comando

```bash
docker-compose build && docker-compose up -d
```

3. Comprobar que la imagen ha sido creada

4. Comprobar que la aplicación ha sido desplegada correctamente

> You will have to wait until Nexus is configured. To check if Nexus is ready you can run `docker ps -a`. Nexus will be available when **nexus** container _STATUS_ is "healthy" and **provisioner** is "exited".





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
http://localhost:8081/
```

Usuarios disponibles 

* admin/admin123


### Login en Docker Registry
> Default credentials for Nexus are: *admin/admin123*

```sh
docker login -u admin -p admin123 localhost:8082
```

```sh
docker login -u admin -p admin123 localhost:8083
```

### Configuración "Global" de Docker para usar los Repositorios de Nexus SIN Autenticación

Se requiere cambiar la configuración del daemon de Docker de la instalación para : permitir usar HTTP, indentificar la ubicación de los respositorios ,etc.

1. Localizar el fichero **daemon.xml** : docker/daemon.json

Puede encontratse en : /etc/docker/daemon.json

El nombre del fichero puede variar segun versión y plataforma

Se puede modificar de forma gráfica

2. Modificar el fichero

```bash
{
  "insecure-registries" : [
    "localhost:8100",
    "localhost:8082",
    "localhost:8083"
  ],
  "debug" : true,
  "experimental" : true
}
```

Con el apartado experimental y debug funciona sin tener dar de alta los nuevos repositorios pero serían interesante dar de alta : "localhost:8082" y "localhost:8083"

Eso debería de permitir trabajar con HTTPs y HTTP -> La configuración es muy dependiente del sistema operativo

"disable-legacy-registry": true


### Configuración "Global" de Docker para  usar repositorios privados de Nexus CON Autenticación

Dependiendo de los mecanismos o plugins que se vayan a utilizar para realizar un push de una imagen se aconseja configurarlo de forma global a docker para no tener que hacer login cada vez

1. Localizar el fichero **config.json** : ~/.docker/config.json

```sh
"auths": {
    "your-repo:8082": {
			"auth": "YWRtaW46YWRtaW4xMjM="
		},
    "https://index.docker.io/v1/": {
      "auth": "FOO",
      "email": "me@me.com"
    }
  }
```

El parámetro "auth" se facilita en base 64 de "username:password"

```sh
echo -n 'username:password' | base64
```

Se hará necesario añadir el server en el fichero : $MAVEN_HOME/settings.xml

```sh
<server>
  <id>docker.io</id>
  <username>FOO</username>
  <password>BAR</password>
</server>
```




### Push imagen en Docker Registry

1. Localizar el directorio de un proyecto con fichero DockerFile
2. Ejecutar la construcción del proyecto para verificar la generación del artefacto
3. Generar Imagen

Importante : Establecer etiqueta para identificar el proyecto

```sh
docker build -t ETIQUETA/NOMBRE_IMAGEN:TAG

Ejemplo SIN TAG 
docker build -t acme/acme-greeting-api-restful-k8s .

Ejemplo CON TAG 
docker build -t acme/acme-greeting-api-restful-k8s:2 .
```

4. Etiquetar Imagen

Importante : Establecer etiqueta para identificar el proyecto

```sh
docker tag ETIQUETA/NOMBRE_IMAGEN localhost:8083/ETIQUETA/NOMPRE_IMAGEN:TAG

Por ejemplo 
docker tag acme/acme-greeting-api-restful-k8s localhost:8083/acme/acme-greeting-api-restful-k8s

o incluyendo la versión / tag

docker tag acme/acme-greeting-api-restful-k8s:1 localhost:8083/acme/acme-greeting-api-restful-k8s:1


```

5. Autenticarse 

```sh
docker login -u admin -p admin123 localhost:8082
```

```sh
docker login -u admin -p admin123 localhost:8083
```

6. Push Imagen

```sh
docker push localhost:8083/ETIQUETA/NOMPRE_IMAGEN

Por ejemplo
docker push localhost:8083/acme/acme-greeting-api-restful-k8s
```


7. Verificar sobre Nexus

8. Pull Image

```sh
docker pull localhost:8082/ETIQUETA/NOMPRE_IMAGEN

Por ejemplo
docker pull localhost:8082/acme/acme-greeting-api-restful-k8s
```

9. Ejecutar la imagen como container

```sh
docker run -p 8091:8091 -t localhost:8082/acme/acme-greeting-api-restful-k8s

```




## Versionado

**Nota :** [SemVer](http://semver.org/) es usado para el versionado.





## Autores

* **atSistemas**
