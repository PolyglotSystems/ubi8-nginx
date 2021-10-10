FROM registry.access.redhat.com/ubi8/ubi:latest as BUILDER

# Setup Default Args
ARG NGINX_VERSION=7.4
ARG SOURCE_NAME

USER root

# Environmental Variables
ENV PATH=/opt/app-root/bin/:$PATH

# Update image
RUN yum update -y --disablerepo=* --enablerepo=ubi-8-appstream --enablerepo=ubi-8-baseos \
 && yum -y module enable nginx:$NGINX_VERSION \
 && yum clean all \
 && rm -rf /var/cache/yum \
 && rm -rf /var/log/*

# Install NPM and NodeJS
RUN yum install -y --disablerepo=* --enablerepo=ubi-8-appstream --enablerepo=ubi-8-baseos nginx npm nodejs nodejs-devel autoconf automake make git wget curl \
 && yum clean all \
 && rm -rf /var/cache/yum \
 && rm -rf /var/log/*

# Clear Image
RUN rm -rf /var/www/html \
 && mkdir -p /var/www/html \
 && mkdir -p /opt/app-root/{bin,src} \
 && mkdir -p /var/{log,run}/nginx \
 && touch /var/log/nginx/error.log \
 && chown -R 1001:1001 /opt/app-root \
 && chown -R 1001:1001 /var/www/ \
 && chown -R 1001:1001 /var/{log,run}/nginx/ \
 && chmod -R 777 /var/{log,run}/nginx/ \
 && chmod -R 777 /var/www/

# Copy files
COPY container-root/ /
#COPY app-src/ /var/www/html/
#COPY .git/refs/heads/main /var/www/html/storage/.gitchecksum

USER 1001

WORKDIR "/var/www/html"

CMD [ "sh", "/start.sh" ]