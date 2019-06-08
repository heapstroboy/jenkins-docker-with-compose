FROM jenkins/jenkins:lts

USER root

RUN wget --no-verbose -O /tmp/apache-maven-3.5.4-bin.tar.gz http://apache.cs.ut$

RUN tar xzf /tmp/apache-maven-3.5.4-bin.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.5.4 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.5.4-bin.tar.gz
ENV MAVEN_HOME /opt/maven
RUN apt-get update -qq
RUN apt-get install -qqy
RUN apt-get install -f git
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt
USER jenkins
