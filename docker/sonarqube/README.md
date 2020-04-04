# SonarQube

This project represents a basic and standalone installation of **Sonarqube** with **Docker**

https://docs.sonarqube.org/latest/analysis/overview/


Different installations/configurations are covered:

BASIC

* SonarQube + Database + Volume
CUSTOM



## Technological Stack

* [Docker](https://www.docker.com/) - Container Technology
* [Docker Hub](https://hub.docker.com/) - Docker Public repository
* [Sonarqube](https://www.sonarqube.org/) - Code Quality and Security Platform
* [Postgres](https://www.postgresql.org/) - Relational Database

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

1. Check Maven settings file : (usually at ~/.m2/settings.xml) -> .m2 folder

2. Edit o create Maven settings file : settings.xml

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

1. Add sonar configuration file : sonar.properties

https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/

```bash
docker-compose up
```



#### Project Sonar Configuration

1. Add Project Sonar configuration file : sonar-project.properties

```bash
sonar.projectName=example1
sonar.projectKey=com.acme.example:example1
sonar.host.url=http://localhost:9000
sonar.sources=src/
sonar.sourceEncoding=UTF-8
sonar.login=xxx
```

2. Generate security token My Account -> Security

Add property : sonar.login



#### Code coverage report with Jacoco

1. Add Jacoco plugin

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

To do so, open pom.xml file once again and in <properties> section add <sonar.exclusions> section in which you need to provide packages and/or classes that you want to exclude from the coverage report:

<properties>
   <!--- Other properties --->   <sonar.exclusions>
      **/model/**,**/config/**,**/KanbanApplication.java
   </sonar.exclusions></properties>


https://funnelgarden.com/sonarqube-jenkins-docker/

https://medium.com/@theopendle/github-jenkins-sonarqube-integration-for-java-maven-4-4-code-analysis-with-sonarqube-da569db417b6

https://onthedock.github.io/post/180522-pipeline-analisis-de-codigo-con-sonarqube/

https://github.com/SonarSource/docker-sonarqube/blob/442f950dae232fca8e1e919e017270971cee46f6/4.5.6/Dockerfile#L37%20Sonarqube%20Dockerfile

https://www.ivankrizsan.se/2019/09/28/gitlab-ci-cd-pipeline-for-maven-based-applications/

https://medium.com/faun/creating-a-free-private-npm-registry-with-verdaccio-e1becdc542b

<build>
  <plugins>
      <plugin>
          <groupId>org.springframework.boot</groupId>
          <artifactId>spring-boot-maven-plugin</artifactId>
      </plugin>
      <plugin>
          <groupId>org.jacoco</groupId>
          <artifactId>jacoco-maven-plugin</artifactId>
          <configuration>
              <append>true</append>
          </configuration>
          <executions>
              <execution>
                  <goals>
                      <goal>prepare-agent</goal>
                  </goals>
              </execution>
              <execution>
                  <id>post-unit-test</id>
                  <phase>test</phase>
                  <goals>
                      <goal>report</goal>
                  </goals>
              </execution>
          </executions>
      </plugin>
  </plugins>
</build>


## Versioning

**Note :** [SemVer](http://semver.org/) is used for the versioning.
To see the available versions access the repository tags





## Authors

* **Víctor Madrid**
