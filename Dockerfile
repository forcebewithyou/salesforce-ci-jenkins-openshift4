FROM image-registry.openshift-image-registry.svc:5000/salesforce-ci/ose-jenkins
ARG JENKINS_VERSION=2.263.2
ARG JENKINS_WAR_PATH=/usr/lib/jenkins

USER root

RUN rm $JENKINS_WAR_PATH/jenkins.war


RUN wget -O $JENKINS_WAR_PATH/jenkins.war https://get.jenkins.io/war-stable/$JENKINS_VERSION/jenkins.war

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

USER jenkins