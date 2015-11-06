# Docker base image for OpenJDK8.
FROM sproutupco/alpine-java-openjdk
MAINTAINER Peter Andersen <peter@sproutup.co>


# Setup environment
ENV JENKINS_VERSION 1.636
ENV JENKINS_SHA 7c671378735106d87203005b9d03cde8df9981a9
ENV JENKINS_USER jenkins
ENV JENKINS_GROUP jenkins
ENV JENKINS_HOME /var/jenkins
ENV JENKINS_BASE /home/jenkins
ENV JENKINS_UC https://updates.jenkins-ci.org

RUN apk update &&\
    apk add curl git wget openssh ttf-dejavu

# Jenkins is run with user `jenkins`, uid = 1000
# If you bind mount a volume from the host or a data container,
# ensure you use the same uid
RUN addgroup jenkins && \
    adduser -u 1000 -D -s /bin/sh -G jenkins jenkins

# INSTALL EB CLI
RUN apk add py-pip && \
    pip install awsebcli && \
    eb --version

# ADD SSH KEY
ADD .ssh $JENKINS_BASE/.ssh
RUN chown -R jenkins:jenkins $JENKINS_BASE && \
    chmod 600 $JENKINS_BASE/.ssh/*

# `/usr/share/jenkins/ref/` contains all reference configuration we want 
# to set on a fresh new installation. Use it to bundle additional plugins 
# or config file with your custom jenkins Docker image.
RUN mkdir -p /usr/share/jenkins/ref/init.groovy.d

# GET JENKINS CONFIG FROM GITHUB
USER jenkins
RUN git clone git@github.com:sproutup/jenkins.git $JENKINS_BASE/jenkins

USER root
RUN ln -s $JENKINS_BASE/jenkins/opt/jenkins $JENKINS_HOME

# INSTALL JENKINS
RUN curl -fL http://mirrors.jenkins-ci.org/war/$JENKINS_VERSION/jenkins.war -o /usr/share/jenkins/jenkins.war \
  && echo "$JENKINS_SHA /usr/share/jenkins/jenkins.war"
# | sha1sum -c -

RUN chown -R jenkins /usr/share/jenkins/ref

EXPOSE 8080

USER jenkins

# Start container
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]

#CMD ["java","-version"]
