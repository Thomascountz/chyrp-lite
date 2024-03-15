FROM php:8.2-apache

WORKDIR /var/www/html
COPY . .

RUN chown -R www-data ./*

RUN apt-get update && apt-get install -y \
    libonig-dev \
    libpq-dev \
    libsqlite3-dev \
    && docker-php-ext-install pdo_mysql pdo_pgsql pdo_sqlite

EXPOSE 80
VOLUME /var/www/html
CMD ["apache2-foreground"]
