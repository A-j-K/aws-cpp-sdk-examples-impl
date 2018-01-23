FROM andykirkham/aws-sdk-cpp:latest
MAINTAINER Andy Kirkham <andy@spiders-lair.com>

ARG LOCAL_USER_NAME
ENV LOCAL_USER_NAME ${LOCAL_USER_NAME:-ajk}

ARG LOCAL_USER_UID
ENV LOCAL_USER_UID ${LOCAL_USER_UID:-1000}

RUN apt-get install -y sudo

RUN groupadd -r app -g $LOCAL_USER_UID \
	&& useradd -u $LOCAL_USER_UID -r -g app -m -d /home/$LOCAL_USER_NAME -s /bin/bash -c "App user" $LOCAL_USER_NAME \
	&& chmod 755 /home/$LOCAL_USER_NAME

RUN echo "$LOCAL_USER_NAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN mkdir /app \
	&& chown $LOCAL_USER_NAME:app /app \
	&& chmod 775 /app

USER $LOCAL_USER_NAME 
WORKDIR /app 

