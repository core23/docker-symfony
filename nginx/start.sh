#!/bin/bash

/bin/sed -i "s@<APP_SERVER_NAME>@${APP_SERVER_NAME}@" /etc/nginx/sites-enabled/default
/bin/sed -i "s@<PHP_HOST>@${PHP_1_PORT_9000_TCP_ADDR}@" /etc/nginx/sites-enabled/default
/bin/sed -i "s@<PHP_PORT>@${PHP_1_PORT_9000_TCP_PORT}@" /etc/nginx/sites-enabled/default

/usr/sbin/nginx
