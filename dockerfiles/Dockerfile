#  Create a new image from the base nodejs 7 image.
FROM node:8.1.2

MAINTAINER Yoichi Kawasaki <yoichi.kawasaki@outlook.com>

# ENV setup
ENV SSH_PASSWD "root:Docker!"

COPY docker-entrypoint.sh /bin/
COPY sshd_config /etc/ssh/

RUN apt-get update \
    && apt-get install -y --no-install-recommends openssh-server vim \
    && rm -rf /var/lib/apt/lists/*

# Download mean app
# You can use .dockerignore to exlcude files. Works just as .gitignore does.
# Copy the client application source files including package.json
RUN set -ex \
    && git clone https://github.com/yokawasa/angular4-mean-starter.git \
    && mv angular4-mean-starter /opt/meanapp

RUN chmod -R 777 /opt/meanapp \
    && echo "root:Docker!" | chpasswd \
    && chmod 755 /bin/docker-entrypoint.sh

USER node

RUN cd /opt/meanapp \
  && npm install

USER root

# 80 = HTTP, 443 = HTTPS, 4200 = Angular, 3000 = Node.JS/Express, 2222 = SSH
EXPOSE 4200 3000 2222

# Set the created directory as the working directory
WORKDIR /opt/meanapp

# Start the application. This is the same as running ng serve.
ENTRYPOINT ["/bin/docker-entrypoint.sh"]
