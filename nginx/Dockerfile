FROM debian:jessie

MAINTAINER Christian Gripp <mail@core23.de>

RUN apt-get update && apt-get install -y \
    nginx

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
ADD vhost.conf /etc/nginx/sites-enabled/default
ADD start.sh /start.sh

RUN usermod -u 1000 www-data

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/start.sh"]
