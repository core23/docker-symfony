FROM nginx:latest

MAINTAINER Christian Gripp <mail@core23.de>

ENV NGINX_HOST="localhost"
ENV NGINX_PORT=80
ENV PHP_HOST="php"
ENV PHP_PORT="9000"

ADD conf /etc/nginx/

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
