# Docker base image for OpenJDK8.
FROM sproutupco/alpine-java-openjdk
MAINTAINER Peter Andersen <peter@sproutup.co>

# Setup environment
ENV ACTIVATOR_VERSION 1.3.6
ENV ACTIVATOR_HOME /var/activator

RUN apk update &&\
    apk add curl git wget openssh ttf-dejavu bash

# INSTALL TYPESAFE ACTIVATOR
#RUN mkdir $ACTIVATOR_HOME && \
#    cd $ACTIVATOR_HOME && \
#    wget -nv http://downloads.typesafe.com/typesafe-activator/$ACTIVATOR_VERSION/typesafe-activator-$ACTIVATOR_VERSION-minimal.zip && \
#    unzip typesafe-activator-$ACTIVATOR_VERSION-minimal.zip -d . && \
#    rm typesafe-activator-$ACTIVATOR_VERSION-minimal.zip && \
#    mv activator-$ACTIVATOR_VERSION-minimal activator-$ACTIVATOR_VERSION && \
#    chmod a+x activator-$ACTIVATOR_VERSION/activator && \
#    ln activator-$ACTIVATOR_VERSION/activator /usr/local/bin/activator && \
#    ln activator-$ACTIVATOR_VERSION/activator-launch-$ACTIVATOR_VERSION.jar /usr/local/bin/activator-launch-$ACTIVATOR_VERSION.jar

RUN cd /var && \
  wget -nv http://downloads.typesafe.com/typesafe-activator/1.3.6/typesafe-activator-1.3.6.zip && \
  unzip typesafe-activator-1.3.6.zip && \
  rm -f /var/typesafe-activator-1.3.6.zip

ENV PATH $PATH:/var/activator-dist-1.3.6

EXPOSE 9000

# Start container
#CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]

CMD ["java","-version"]
