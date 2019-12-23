#!/bin/bash
set -eu

/bin/sed -i \
  -e "s@\$NGINX_HOST@${NGINX_HOST}@" \
  -e "s@\$NGINX_PORT@${NGINX_PORT}@" \
  -e "s@\$PHP_HOST@${PHP_HOST}@" \
  -e "s@\$PHP_PORT@${PHP_PORT}@" \
  /etc/nginx/conf.d/*.conf

/usr/sbin/nginx
