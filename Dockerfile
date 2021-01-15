FROM jenkins/jenkins:lts
# FROM quay.io/openshift/origin-jenkins
USER root
RUN apt-get update \
	&& echo "Installing build dependencies" \
	&& apt-get install --yes --no-install-recommends \
	dirmngr \
	fontconfig \
	gnupg \
	unzip \
	zip \
	wget \
	git-all \
	curl \
	&& rm --recursive --force /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get -y install nodejs
RUN node -v
RUN npm -v

RUN npm install -g sfdx-cli

RUN sfdx --version

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
USER jenkins