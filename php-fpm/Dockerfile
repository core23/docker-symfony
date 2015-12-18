FROM debian:jessie

MAINTAINER Christian Gripp <mail@core23.de>

RUN apt-get update && apt-get install -y \
    php5-cli \
    php5-fpm \
    php5-mcrypt \
    php5-mysql \
    php5-gd \
    php5-imagick \
    php5-curl \
    php5-json \
    php5-intl

ADD php.ini /etc/php5/fpm/conf.d/
ADD php.ini /etc/php5/cli/conf.d/

ADD www.conf /etc/php5/fpm/pool.d/

RUN usermod -u 1000 www-data

EXPOSE 9000

WORKDIR /var/www

CMD ["php5-fpm", "-F"]
