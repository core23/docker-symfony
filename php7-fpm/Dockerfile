FROM php:7.0-fpm

MAINTAINER Christian Gripp <mail@core23.de>

RUN apt-get update && apt-get install -y \
        git \
        unzip

# Intl extension
RUN apt-get install -y \
        libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl

# SOAP extension
RUN apt-get install -y \
        libxml2-dev \
    && docker-php-ext-install soap

# GD extension
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

# Image Magic extension
RUN apt-get install -y \
        imagemagick \
        libmagickwand-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer.phar; \
    echo 'COMPOSER=$(which composer.phar)' >> /usr/bin/composer; \
    echo 'php -d memory_limit=-1 $COMPOSER $@' >> /usr/bin/composer; \
    chmod +x /usr/bin/composer;

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

WORKDIR /var/www/symfony

RUN mkdir -p /var/www/symfony/var && chown -Rv www-data:www-data /var/www/symfony/var \
    && mkdir -p /var/www/symfony/web/uploads && chown -Rv www-data:www-data /var/www/symfony/web/uploads
