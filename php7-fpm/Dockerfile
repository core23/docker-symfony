FROM php:7.4-fpm

MAINTAINER Christian Gripp <mail@core23.de>

RUN apt-get update && apt-get install -y \
        openssl \
        git \
        unzip \
        gnupg \
        apt-transport-https

# NPM tools
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash - \
    && apt-get install -y nodejs yarn \
    && npm install npm --global

# Intl extension
RUN apt-get install -y \
        libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl

# string extensions
RUN apt-get install libonig-dev \
    && docker-php-ext-install \
        gettext \
        mbstring

# SOAP extension
RUN apt-get install -y \
        libxml2-dev \
    && docker-php-ext-install soap

# GD extension
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd \
    && docker-php-ext-install gd

# ZIP
RUN apt-get install -y libzip-dev \
    && docker-php-ext-install zip

# Bcmath
RUN docker-php-ext-install bcmath

# OPcache
RUN docker-php-ext-install \
        opcache \
    && docker-php-ext-enable \
        opcache

# Image Magic extension
RUN apt-get install -y \
        imagemagick \
        libmagickwand-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick

# Redis extension
RUN pecl install -o -f redis \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis

# Mongo extension
RUN apt-get install -y \
            libssl-dev \
    && pecl install -o -f mongodb \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable mongodb

# XSL
RUN apt-get install -y \
        libxslt-dev \
   && docker-php-ext-install xsl

# Memory Limit
RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer;

# Set timezone
RUN rm /etc/localtime \
    && ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
    && "date"

# PDO extension
RUN docker-php-ext-install pdo pdo_mysql

# install xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.idekey=\"PHPSTORM\"" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

EXPOSE 9001

WORKDIR /var/www/symfony

RUN mkdir -p /var/www/symfony/var && chown -Rv www-data:www-data /var/www/symfony/var \
    && mkdir -p /var/www/symfony/public/uploads && chown -Rv www-data:www-data /var/www/symfony/public/uploads

CMD ["php-fpm", "-F"]
