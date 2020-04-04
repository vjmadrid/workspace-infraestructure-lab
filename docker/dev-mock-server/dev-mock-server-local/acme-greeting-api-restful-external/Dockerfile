FROM openjdk:8-jdk-alpine

EXPOSE 8091

COPY /conf/application-pre.yml /conf/application-pre.yml

ADD acme-greeting-api-restful.jar acme-greeting-api-restful.jar

ENTRYPOINT ["java","-jar","-Dspring.profiles.active=local","-Dspring.config.location=file:./conf/application-pre.yml","acme-greeting-api-restful.jar"]

