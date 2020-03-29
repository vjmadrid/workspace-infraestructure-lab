FROM sonarqube:7.1-alpine

# Configuration
# RUN bash -c '[ACTION] General Configuration ...'

# RUN bash -c '[CONFIG] Copy sonar.properties to /opt/sonarqube/conf/ ...'
COPY sonar.properties /opt/sonarqube/conf/

# RUN bash -c '[CONFIG] [SOFTWARE] Install cUrl ...'
RUN apk add --no-cache curl

# Plugins
# RUN bash -c '[ACTION] Install Plugins ...'

RUN mkdir -p $HOME/plugins

ENV SLACK_PLUGIN_VERSION 2.1.2
# RUN bash -c '[PLUGIN] Install Slack ${SLACK_PLUGIN_VERSION} ...'
RUN set -x && curl -sLo $HOME/plugins/cks-slack-notifier-${SLACK_PLUGIN_VERSION}.jar \
	https://github.com/kogitant/sonar-slack-notifier-plugin/releases/download/${SLACK_PLUGIN_VERSION}/cks-slack-notifier-${SLACK_PLUGIN_VERSION}.jar

ENV JAVA_PLUGIN_VERSION 5.9.2.16552
RUN set -x && curl -sLo $HOME/plugins/sonar-java-plugin-${JAVA_PLUGIN_VERSION}.jar \
	https://binaries.sonarsource.com/Distribution/sonar-java-plugin/sonar-java-plugin-${JAVA_PLUGIN_VERSION}.jar

# COPY sonar-branch-community-1.0.1.jar $HOME/plugins/

RUN cp $HOME/plugins/* $SONARQUBE_HOME/extensions/plugins

