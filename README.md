# workspace-infraestructure-lab

This repository serves as a **catalogue** of **infrastructure and tools proposals** to cover the different aspects, technologies, products, etc.

For this purpose, a container technology such as :  **Docker**  , **Cri-o**, **Singlarity**, ...

Some of the aspects covered by this system are :

**Systems Aspects**

* Have "commercial" products installed as containers
* Facilitate a rapid test lab
* Provide support and help when installing products : platforms, distributions, versions, etc.
* Provide support and help when configuring products
* Provide support and help in integrating different products to work together
* Provide support and help when integrating products with development aspects : frameworks, etc.
* Facilitate the generation of scripts to automate the above: installations, configuration, use, etc.
* Provide complete platforms for CI / CD : installations, configurations, integrations, pipelines, plugins, etc.

Examples : install Sonarqube in version 8.5 with all Embedded, install Sonarqube with the Jacoco configuration (for example by setting the report location path), install Sonarqube with mysql integration as a database for persistence, install plugins to view compatibility issues, etc.


**Learning Aspects**

* Provide the infrastructure to assist or be used in the courses
* Provide a mechanism to create/destroy components easily and quickly during the learning process
* Provide the necessary infrastructure such as "black boxes" so that learning can be focused on what is really necessary -> "incisive" learning
* Facilitate single-point focus
* It makes it easy to train in almost anything
* There are many resources on the Internet
* It facilitates different levels of learning: basic (there are already half assembled parts) and advanced (assembling from 0)

Examples : change Sonarqube configurations, try to install plugins to see if their functionality


**Development Aspects**

* Provide product installations in a local environment : web server, servlet container, database , etc
* To facilitate the deployment and use tests of the developments in environments as similar as possible to the productive environments 
* Provide service/microservice platforms to develop/test the functionalities in a local environment (Mocking service layer to be used by front or back to design complex services)

Examples : install Tomcat 8.5 to test front end deployment, install WSO2 IS, etc.


**Testing/QA Aspects**

* Provide product facilities for testing and QA
* Facilitate mechanisms to reduce problems that may be found in other environments, with other data sets, with other configurations, with other types of tests, etc.
* Mocking those pieces or parts that can be interesting : products, databases, services, etc.

Examples : install Sonarqube to evaluate the code with the same rules that will be evaluated in other environments, services layer mocked or with real use with test data sets, database loaded with dump or test data sets, etc.


Each proposal has 3 formats :

- [basic](#basic)
- [custom](#custom)
- [advance](#advance)

### <a name="basic">basic</a>

Proposal that includes a **docker-compose.yml** and/or **Dockerfile** containing :

* The use of a standard image of the product (provided by the manufacturer with the configuration and the settings/options chosen by the manufacturer : platform, version, etc.)
* OPTIONAL : Sometimes the installation can be modified by changing some configuration elements (provide a file etc.)


### <a name="custom">custom</a>

Proposal that includes a **docker-compose.yml** and/or **Dockerfile** containing :

* Similar to the "basic" one
* OPTIONAL : You can add certain external elements such as : plugins, extensions, etc. -> To do this we download curl and from there we download things

### <a name="advance">advance</a>

Proposal that includes a **docker-compose.yml** and/or **Dockerfile** containing :

* The use of an image of a "basic" operating system
* The product is installed by performing the actions by hand with system commands
* Makes it easier to go into more complex details
* Makes it easier to understand the steps taken and convert them to a script
* OPTIONAL : Allows you to install as much as you want





## Technological Stack

* [Docker](https://www.docker.com/) - Container Technology
* [Docker Hub](https://hub.docker.com/) - Docker Public repository
* Others: Tomcat, Jenkins, Apache Kafka, ....

Dependencies with architecture projects

N/A

Third Party Dependencies

N/A





## Prerequisites

Define what elements are needed to install the software

* Docker installed (19+)





## Installation

Each project/library has its form





## Testing

Each project/library has its form





## Deploy

Each project/library has its form





## Use

Each project/library has its form





## Versioning

**Note :** [SemVer](http://semver.org/) is used for the versioning.
To see the available versions access the repository tags





## Authors

* **Víctor Madrid**
