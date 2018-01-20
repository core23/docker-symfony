FROM debian:jessie

MAINTAINER Christian Gripp <mail@core23.de>

RUN apt-get update && apt-get install -y \
    nginx

ENV SERVER_HOST="local.dev"

ADD nginx.conf /etc/nginx/
ADD symfony.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/symfony.conf /etc/nginx/sites-enabled/symfony
RUN rm /etc/nginx/sites-enabled/default

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

RUN usermod -u 1000 www-data

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]
