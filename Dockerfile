FROM httpd:alpine
MAINTAINER Rodrigo <rodimes@gmail.com>

ENV FOLDER=mydomain
ARG SSL_FOLDER=./ssl/${FOLDER}/
ARG HTTPD_CONF_FILE=./confs/${FOLDER}/httpd.conf
ARG HTTPD_SSL_CONF_FILE=./confs/${FOLDER}/httpd-ssl.conf

COPY ${SSL_FOLDER} /usr/local/apache2/conf/certs
COPY ${HTTPD_CONF_FILE} /usr/local/apache2/conf
COPY ${HTTPD_SSL_CONF_FILE} /usr/local/apache2/conf/extra

RUN echo '<META http-equiv="refresh" content="0;URL=/jenkins/">' > /usr/local/apache2/htdocs/index.html

EXPOSE 80 443
