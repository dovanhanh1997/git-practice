FROM php:7.2.4-fpm-alpine

RUN mkdir -p /app

WORKDIR /app

COPY . .

RUN apk update && apk add \
 curl \
 bash

RUN curl -sS https://getcomposer.org/installer | php && \
  mv composer.phar /usr/local/bin/composer

RUN docker-php-ext-install pdo pdo_mysql

CMD bash -c "composer update && \
 php artisan key:generate && \
 php artisan config:cache && \
 php artisan serve --host 0.0.0.0 --port 8000"
