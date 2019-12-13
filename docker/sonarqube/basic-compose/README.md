# SonarQube Basic Standalone Compose

This project represents a basic and standalone installation of **Sonarqube** with **Docker**





## Technological Stack

* [Docker](https://www.docker.com/) - Container Technology
* [Docker Hub](https://hub.docker.com/) - Docker Public repository
* [SonarQube](https://www.sonarqube.org/) - Code Quality and Security Platform

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

```bash
docker-compose up
```

2. Verify exist image created




## Use


### Use Browser

The service will accept HTTP GET requests at :

```bash
http://localhost:9000/
```

And login with : admin/admin





### Maven Settings Configuration

This a configuration mechanism that affects all projects used for the configuration user

It avoids having to add the code in each one of the POM.xml

1. Check Maven settings file : (usually at ~/.m2/settings.xml)

2. Edit o create Maven settings file

3. Add plugin group

```bash
<settings>
  ...
  
  <pluginGroups>
    <pluginGroup>org.sonarsource.scanner.maven</pluginGroup>
  </pluginGroups>
    
  ...

</settings>
```

3. Add sonar profile

```bash
<settings>

  ...

  <profiles>
    
    ...
    
    <profile>
      <id>sonar</id>
      <activation>
        <activeByDefault>false</activeByDefault>
      </activation>
      <properties>
        <!-- Enter your SonarQube instance URL here -->
        <sonar.host.url>http://localhost:9000</sonar.host.url>
      </properties>
    </profile>
    
    ...

  </profiles>
  
  ...

</settings>
```




### Maven POM Configuration

#### Sonar Configuration

#### Code coverage report with Jacoco

```bash
<build>

  ...

  <plugins>

    ...

    <!-- jacoco-maven-plugin : Plugin used to generate code coverage -->
		<plugin>
      <groupId>org.jacoco</groupId>
      <artifactId>jacoco-maven-plugin</artifactId>
      <version>0.8.5</version>
      <executions>
        <execution>
          <id>coverage-initialize</id>
          <goals>
            <goal>prepare-agent</goal>
          </goals>
        </execution>
        <execution>
          <id>coverage-report</id>
          <phase>test</phase>
          <goals>
            <goal>report</goal>
          </goals>
          <configuration>
            <outputDirectory>target/jacoco-report</outputDirectory>
          </configuration>
        </execution>
      </executions>
    </plugin>

    ...

  </plugins>

</build>
```

### Configuring Jenkins with SonarQube

1. Access to Jenkins

2. Manage Jenkins -> Manage plugins

3. Install "SonarQube Scanner" plugin

4. Check SonarQube server submenu in Manage Jenkins -> Configure System

5. Edit submenu and click on Add SonarQube

* Importante : the URL changes if you use sonarquebe docker ci proyect, NGINX ,...

6. Jenkins requires a secret token to access Sonar Qube

* Access to Sonarqube
* Access to "My Account" menu 
* Access a Generate Token section
* Enter a name
* Generate token

* Access to Jenkins
* Access to Server authentication token domain
* Click on the JEnkins

    Troubleshooting: the Add button may not work at first (clicking has no effect). If that is the case click Apply to save your configuration and refresh the page to solve the issue.

* Check popup will appear
* Select Secret text as the kind of credential
* Enter your SonarQube token in the Secret field


### Configuring the Jenkins Sonarqube

1. Acces to Jenkins

2. Manage Jenkins -> Global Tool Configuration -> SonarQube Scanner

3. Add SonarQube Scanner

Now return to your job configuration and under Build, add a new Execute SonarQube Scanner build step : mvn clean install



### Execution


```bash
mvn clean verify sonar:sonar

or

mvn sonar:sonar \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=038d5120360c40bd9b28033f21b392f17c3f085d
```







## Versioning

**Note :** [SemVer](http://semver.org/) is used for the versioning.
To see the available versions access the repository tags





## Authors

* **Víctor Madrid**
