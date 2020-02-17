FROM tomcat:8.5.47-jdk8-corretto

#RUN rm -rf /usr/local/tomcat/webapps/*

ADD conf/tomcat-users.xml /usr/local/tomcat/conf/

ADD conf/context.xml /usr/local/tomcat/webapps/manager/META-INF/

CMD ["catalina.sh","run"]

EXPOSE 8080
