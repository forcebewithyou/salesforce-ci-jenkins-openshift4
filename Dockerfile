FROM image-registry.openshift-image-registry.svc:5000/salesforce-ci/ose-jenkins
ENV JENKINS_VERSION=2.263.2
ENV JENKINS_WAR_PATH=/usr/lib/jenkins

USER root
# RUN yum update \
# 	&& echo "Installing build dependencies" \
# 	&& yum install --yes --no-install-recommends \
# 	dirmngr \
# 	fontconfig \
# 	gnupg \
# 	unzip \
# 	zip \
# 	wget \
# 	git-all \
# 	curl \
# 	&& rm --recursive --force /var/lib/apt/lists/*

# RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
# RUN yum -y install nodejs
# RUN node -v
# RUN npm -v

# RUN npm install -g sfdx-cli

# RUN sfdx --version

RUN cd /usr/lib/jenkins
RUN rm jenkins.war

RUN wget https://get.jenkins.io/war-stable/2.263.2/jenkins.war
# RUN wget https://get.jenkins.io/war-stable/$JENKINS_VERSION/jenkins.war

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
USER jenkins