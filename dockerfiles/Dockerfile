#  Create a new image from ningx image.
FROM nginx

MAINTAINER Yoichi Kawasaki <yoichi.kawasaki@outlook.com>

RUN apt-get update \
  && apt-get install --assume-yes --no-install-recommends \
    apt-transport-https build-essential bzip2 curl git rlwrap vim \
  && apt-get install -y --no-install-recommends openssh-server \
  && curl -sL https://deb.nodesource.com/setup_6.x | bash - \
  && apt-get install --assume-yes --no-install-recommends nodejs \
  && apt-get clean

# ENV setup
ENV SSH_PASSWD "root:Docker!"

# Download mean app
# You can use .dockerignore to exlcude files. Works just as .gitignore does.
# Copy the client application source files including package.json
RUN set -ex \
    && git clone https://github.com/yokawasa/angular4-mean-starter.git \
    && mv angular4-mean-starter /opt/meanapp

RUN chmod -R 777 /opt/meanapp \
    && echo $SSH_PASSWD | chpasswd \
    && useradd -ms /bin/bash node

# Install node packages and build as node user
USER node
RUN cd /opt/meanapp \
  && npm install \
  && npm run build 
# Switch back as root user
USER root

# Copy our default nginx config
COPY nginx/default.conf.templ /tmp/
COPY docker-entrypoint.sh /bin/
COPY sshd_config /etc/ssh/

# Final clean up & configurations
RUN rm -rf /usr/share/nginx/html/* \
    && mv /opt/meanapp/public/dist/* /usr/share/nginx/html/ \
    && chmod 755 /bin/docker-entrypoint.sh 

# 80 = HTTP, 4200 = Angular (testing), 3000 = Node.JS/Express, 2222 = SSH
EXPOSE 80 443 4200 3000 2222

# Set the created directory as the working directory
WORKDIR /opt/meanapp

# Start the application. 
ENTRYPOINT ["/bin/docker-entrypoint.sh"]
