# This is a comment
FROM ubuntu:14.04
MAINTAINER Peter Andersen <peter@sproutup.co>
RUN apt-get update && apt-get install -y && rm -rf /var/lib/apt/lists/*

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

ENV JAVA_VERSION 7u75
ENV JAVA_DEBIAN_VERSION 7u75-2.5.4-2

RUN apt-get update && apt-get install -y openjdk-7-jdk && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y wget git curl zip && rm -rf /var/lib/apt/lists/*

ENV JENKINS_HOME /var/jenkins


RUN wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update
RUN apt-get install -y jenkins

EXPOSE 8080

# will be used by attached slave agents:
EXPOSE 50000

#USER jenkins

#CMD ["/usr/bin/java", "-jar", "/usr/share/jenkins/jenkins.war"]

RUN etc/init.d/jenkins start
