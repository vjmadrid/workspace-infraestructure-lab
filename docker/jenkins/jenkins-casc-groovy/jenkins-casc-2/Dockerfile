FROM jenkins/jenkins:lts

# Install Jenkins Plugins
COPY ./conf/plugins /usr/share/jenkins/plugins
RUN while read i ; \ 
		do /usr/local/bin/install-plugins.sh $i ; \
	done < /usr/share/jenkins/plugins

ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Set Environment Var for Disabling Setup Wizard (Skip)
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Jenkins runs all grovy files from init.groovy.d dir
# use this for creating default admin user
COPY --chown=jenkins:jenkins ./conf/default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

# Install Node / Newman / Postman Platform
USER root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    # Install nodejs
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y apt-utils \
    && apt-get install -y nodejs \
    && apt-get install -y build-essential \
    && apt-get install -y inotify-tools \
    # Install newman
    && npm install -g newman

USER jenkins

# volume for Jenkins settings
VOLUME /var/jenkins_home