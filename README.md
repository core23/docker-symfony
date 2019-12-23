Symfony Docker Container 
========================

[![Continuous Integration](https://github.com/core23/docker-symfony/workflows/Continuous%20Integration/badge.svg)](https://github.com/core23/docker-symfony/actions)

Docker setup for symfony applications using **nginx**, **php-fpm** and **mysql**. There is also an **ELK** stack for accessing the logs.

Usage
=====

```yaml

version: '3.4'

services:
    php:
        image: core23/symfony-php
        volumes:
            - app-data:/var/www/symfony
        links:
            - mysql:mysqldb

    nginx:
        image: core23/symfony-nginx
        ports:
            - 80:80
            - 443:443
        links:
            - php
        volumes:
            - app-data:/var/www/symfony
            - nginx-log:/var/log/nginx
        environment:
            NGINX_HOST: localhost

    mysql:
        image: mysql:5
        ports:
            - 3306:3306
        volumes:
            - db-data:/var/lib/mysql
        environment:
            MYSQL_ROOT_PASSWORD: root-password
            MYSQL_DATABASE: symfony
            MYSQL_USER: symfony
            MYSQL_PASSWORD: super-secret

    elk:
        build: elk
        ports:
            - 81:5601
        volumes:
            - app-data:/var/www/symfony:ro
            - nginx-log:/var/log/nginx:ro

volumes:
    db-data:
    app-data:

```