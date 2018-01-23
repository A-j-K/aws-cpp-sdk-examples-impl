FROM andykirkham/aws-sdk-cpp:latest
MAINTAINER Andy Kirkham <andy@spiders-lair.com>

ARG LOCAL_USER_NAME
ENV LOCAL_USER_NAME ${LOCAL_USER_NAME:-ajk}

ARG LOCAL_USER_UID
ENV LOCAL_USER_UID ${LOCAL_USER_UID:-1000}

ARG TF_VERSION
ENV TF_VERSION="0.11.2"

ARG PK_VERSION
ENV PK_VERSION="1.1.3"

RUN apt-get install -y sudo

WORKDIR /tmp
RUN curl -sSL https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip > terraform.zip \
	&& unzip terraform.zip \
	&& mv terraform /usr/local/bin/terraform \
	&& chmod 755 /usr/local/bin/terraform \
	&& rm -f terraform.zip
RUN curl -sSL https://releases.hashicorp.com/packer/${PK_VERSION}/packer_${PK_VERSION}_linux_amd64.zip > packer.zip \
	&& unzip packer.zip \
	&& mv packer /usr/local/bin/packer \
	&& chmod 755 /usr/local/bin/packer \
	&& rm -f packer.zip 

RUN groupadd -r app -g $LOCAL_USER_UID \
	&& useradd -u $LOCAL_USER_UID -r -g app -m -d /home/$LOCAL_USER_NAME -s /bin/bash -c "App user" $LOCAL_USER_NAME \
	&& chmod 755 /home/$LOCAL_USER_NAME

RUN echo "$LOCAL_USER_NAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN mkdir /app \
	&& chown $LOCAL_USER_NAME:app /app \
	&& chmod 775 /app

USER $LOCAL_USER_NAME 
WORKDIR /app 

