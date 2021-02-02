# FROM image-registry.openshift-image-registry.svc:5000/salesforce-ci/ose-jenkins
FROM registry.redhat.io/openshift3/jenkins-2-rhel7
# FROM jenkins/jenkins:lts
ENV JENKINS_VERSION=2.263.3
ENV JENKINS_WAR_PATH=/usr/lib/jenkins
# ARG JENKINS_WAR_PATH=/usr/share/jenkins/

USER root

RUN rm ${JENKINS_WAR_PATH}/jenkins.war


RUN wget -O ${JENKINS_WAR_PATH}/jenkins.war https://get.jenkins.io/war-stable/${JENKINS_VERSION}/jenkins.war

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh /usr/share/jenkins/ref/plugins.txt

USER jenkins