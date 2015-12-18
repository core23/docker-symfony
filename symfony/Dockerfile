FROM debian:jessie

MAINTAINER Christian Gripp <mail@core23.de>

# PHP libs
RUN apt-get update && apt-get install -y \
    git \
    curl \
    php5-cli \
    php5-fpm \
    php5-mysql \
    php5-gd \
    php5-json \
    php5-intl

# Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

WORKDIR /var/www
