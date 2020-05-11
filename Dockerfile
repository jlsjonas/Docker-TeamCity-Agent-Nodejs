########################################################################
# Based on the official TeamCity Agent image with Nodejs added on top. #
########################################################################

FROM jetbrains/teamcity-agent:latest

ARG BUILD_DATE
ARG VCS_REF

MAINTAINER Jonas De Kegel
LABEL maintainer="Jonas De Kegel"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-url="https://github.com/jlsjonas/Docker-TeamCity-Agent-Nodejs"
LABEL org.label-schema.vcs-ref=$VCS_REF

RUN apt-get update && \
	apt-get install -y build-essential && \
	curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
	apt-get install -y nodejs && \
	apt-get install -y man && \
	apt-get install -y wget && \
	apt-get install -y unzip && \
	apt-get clean all

RUN wget --quiet https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip \
  && unzip terraform_0.12.24_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_0.12.24_linux_amd64.zip
	

COPY docker_opts.sh /services/docker_opts.sh
