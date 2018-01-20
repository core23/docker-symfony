#!/bin/bash

/bin/sed -i "s@SERVER_HOST@${SERVER_HOST}@" /etc/nginx/sites-available/symfony.conf

/usr/sbin/nginx
