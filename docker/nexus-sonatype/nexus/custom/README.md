# Custom Nexus

Esta propuesta representa una instalación custom de **Nexus** con **Docker**

Para ello se hará uso del API REST de aprovisionamiento que proporciona Nexus desde el podremos
"inyectar" (invocar o subir) diferentes scripts que permitirán establecer determinadas configuraciones. Con ello se facilitarán cosas como la automaticación, rehacer la configuración en cada carga, etc.

El scripting de seguridad facilitado se encargara de :

* Aplicar cambios en la configuración global
* Cambiar la password del usuario admin creado por defecto por el container de docker por una más sencilla
* Añadir un usuario corporativo atsistemas tambien con rol "admin"

Se creará un container extra "provisioner" python donde se hará el trabajo intermedio para facilitar el JSON a Nexus

* **provisioner/Dockerfile** : Fichero de creación del contenedor de soporte
* **provisioner/script/security.groovy** : Script Groovy con la configuración de seguridad para Nexus
* **provisioner/utils/json-converter.py** : Script Python que proporciona la utilidad de convertir un script Groovy en JSON
* **provisioner/script/provision.sh** : Script Shell que invoca mediante cURL al API de Nexus y le proporciona la conversión del Script en JSON
* **provisioner/utils/wait-for-it.sh** : Script Shell que permite determinar la situacion de disponibilidad 

Por defecto la instalación del contenedor proporciona :

**Maven**

* Un repositorio privado (hosted) de maven2 para los snapshots
* Un repositorio privado (hosted) de maven2 para las releases
* Un repositorio proxy apuntando a Maven Central
* Un repositorio group para proporcionar todos los repositorios desde una única URL

Consejos :

* Se aconseja crear un nuevo blob store por cada nuevo repos que se vaya a crear
* Los datos de cada repositorio deberían ubicarse en un directorio diferentes dentro de /nexus-data dentro del contenedor

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


### Configuración "Global" de Maven para usar los Repositorios de Nexus

1. Localizar el fichero **settings.xml** : ~/.m2/settings.xml

Recordar que es mejor disponer uno propio por usuario

2. Incorporar las credenciales de acceso a los resposistorios privados de Nexus donde se quiere publicar

Nota : Tener en cuenta que el usuario y la password sea válida y sobre todo que el usuario tenda permisos para poder ooperar con ese repositorio

También es importante tener en cuenta el id del servidor ya que será utilizado en configuraciones posteriores

Hay que tener en cuenta el id del server ya que será referenciado en otros puntos de este ficheros de configuración o bien en los pom.xml que lo utilicen

#### Configuración de uns server miror (tipo public)

Propuesta de nombre para mirror : nexus.ic-<compañia>-<proyecto>

* Dependera de las necesidades (en muchos casos solo hay un repo por compañia)
* Cada valor puede ser opcional


```bash
<settings xxxx>
...
    <servers>

        <!-- Autentication Server used with public mirror -->
        <server>
            <id>nexus.ic-acme-projectX</id>
            <username>admin</username>
            <password>admin123</password>
        </server>

        <!-- Other Servers used -->
        ...
    
    </servers>
...
</settings>
```

#### Configuración de uns server privado de snapshot (tipo hosted)

Propuesta de nombre para snapshot : nexus-snapshots.ic-<compañia>-<proyecto>

```bash
<settings xxxx>
...
    <servers>
        
        ...

        <!-- Autentication Server used with private snapshot for maven-->
        <server>
            <id>nexus-snapshots.ic-acme-projectX</id>
            <username>admin</username>
            <password>admin123</password>
        </server>
        
        <!-- Other Servers used -->
        ...
    
    </servers>
...
</settings>
```

#### Configuración de un server privado de releases (tipo hosted)

Propuesta de nombre para snapshot : nexus-ic-<compañia>-<proyecto>

```bash
<settings xxxx>
...
    <servers>
        
        ...

        <!-- Autentication Server used with private releases for maven-->
        <server>
            <id>nexus-releases.ic-acme-projectX</id>
            <username>admin</username>
            <password>admin123</password>
        </server>

        <!-- Other Servers used -->
        ...
    
    </servers>
...
</settings>
```


3. Incorporar la configuración para que maven use el repositorio group como un mirror central

```bash
<settings xxxx>
...
    <mirrors>

        <!-- Public mirror used with DAE (dae-maven-public include : maven proxy, snapshots and releases -->
        <mirror>
            <id>central</id>
            <name>central</name>
            <url>http://localhost:8081/repository/maven-public/</url>
            <mirrorOf>*</mirrorOf>
        </mirror>

        <!-- Other Mirrors used -->
        ...
        
    </mirrors>
...
</settings>
```

Se puede usar otro id si no requiere autenticacion, en cualquier otro caso el id debería de hacer referencia a uno del area de server como "nexus.ic-acme-projectX"

4. Incorporar la configuración para que se incluyan los plugins en los repositorios

```bash
<settings xxxx>
...
    <pluginGroups>

        <pluginGroup>org.sonarsource.scanner.maven</pluginGroup>
        <pluginGroup>org.sonatype.plugins</pluginGroup>

    </pluginGroups>
...
</settings>
```


### Configuración del "Proyecto" de Maven para descarga los Repos de Nexus por proyecto

1. Localizar el fichero **pom.xml** : <PROJECT_PATH>/pom.xml

2. Incoporar la configuración para descargar las dependencias de Nexus de los repositorios

```bash
<project xxxx>
...
    <!-- Download dependencies from Nexus group -->
	<repositories>
		<repository>
			<id>maven-group</id>
			<url>http://localhost:8081/repository/maven-public/</url>
            <!--
            <releases><enabled>true</enabled></releases>
			<snapshots><enabled>true</enabled></snapshots>
            -->
		</repository>
	</repositories>

    <!-- Download plugins from Nexus group -->
    <pluginRepositories>
        <pluginRepository>
            <id>maven-group</id>
		    <url>http://localhost:8081/repository/maven-public/</url>
            <releases><enabled>true</enabled></releases>
            <snapshots><enabled>true</enabled></snapshots>
        </pluginRepository>
    </pluginRepositories>
...
</project>
```

Con esta referencia se permite al proyecto descargarse las dependencias de librerías publicas y propias a las que referencia el proyecto

Se podrían dar de alta los repositorios : snapshot y release de forma individual

* Se puede llegar a filtrar a que elementos se permiten o no acceder

El id debería de referenciar a un id de server si este requiere autenticación (por ejemplo : "nexus.ic-acme-projectX" ) o bien hacer uso de otro id sino este elemento es publico 

Importante :  tener en cuenta que tambien falta la posibilidad de descargar plugins pero esta parte puede ser opcional



### Configuración del "Proyecto" de Maven para descarga los Repos de Nexus como perfil del fichero settings.xml

1. Localizar el fichero **settings.xml** : ~/.m2/settings.xml

Recordar que es mejor disponer uno propio por usuario

2.  Incorporar la configuración para que maven incluya un perfil "nexus" donde les incluye los repositorio 

```bash
<settings xxxx>
...
    <profile>
      <id>nexus</id>
      
      <repositories>

        <repository>
            <id>maven-group</id>
			<url>http://localhost:8081/repository/maven-public/</url>
            <releases><enabled>true</enabled></releases>
            <snapshots><enabled>true</enabled></snapshots>
        </repository>

        <repository>
            <id>maven-snapshots</id>
            <url>http://localhost:8081/repository/maven-snapshots/</url>
            <layout>default</layout>
            <releases><enabled>false</enabled></releases>
            <snapshots><enabled>true</enabled></snapshots>
        </repository>

        <repository>
            <id>maven-releases</id>
            <url>http://localhost:8081/repository/maven-releases/</url>
            <layout>default</layout>
            <releases><enabled>true</enabled></releases>
            <snapshots><enabled>false</enabled></snapshots>
        </repository>

      </repositories>
      
      <pluginRepositories>
        <pluginRepository>
            <id>maven-group</id>
			<url>http://localhost:8081/repository/maven-public/</url>
            <releases><enabled>true</enabled></releases>
            <snapshots><enabled>true</enabled></snapshots>
        </pluginRepository>
      </pluginRepositories>

    </profile>

    <activeProfiles>
        <activeProfile>local</activeProfile>
        <activeProfile>nexus</activeProfile>
    </activeProfiles>
...
</settings>
```

De esta forma se evita tener que referenciar los repositorios en cada fichero pom.xml y se proporciona de forma comun a todos los proyectos desde el settings.xml 

A todos los efectos tiene el mimo valor que utilizar el campo repository en el pom.xml

El id debería de referenciar a un id de server si este requiere autenticación (por ejemplo : "nexus.ic-acme-projectX" ) o bien hacer uso de otro id sino este elemento es publico 

Importante :  tener en cuenta que tambien falta la posibilidad de descargar plugins pero esta parte puede ser opcional

Recordar que estos perfiles estan activos


### Configuración del "Proyecto" de Maven para publicar en los Repos de Nexus por proyecto

1. Localizar el fichero **pom.xml** : <PROJECT_PATH>/pom.xml

2. Incoporar la configuración para publicar en los repositorios de Nexus

```bash
<project xxxx>
...
    <!-- Publish the project in Nexus -->
	<distributionManagement>
		<snapshotRepository>
			<id>nexus-snapshots.ic-acme-projectX</id>
			<url>http://localhost:8081/repository/maven-snapshots/</url>
		</snapshotRepository>
		<repository>
			<id>nexus-releases.ic-acme-projectX</id>
			<url>http://localhost:8081/repository/maven-releases/</url>
		</repository>
	</distributionManagement>
...
</project>
```

Normalmente estos respositorios requieren autenticación por lo que su id se debería de corresponder con los id de server declarados



## Versionado

**Nota :** [SemVer](http://semver.org/) es usado para el versionado.





## Autores

* **atSistemas**
