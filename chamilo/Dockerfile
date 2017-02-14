FROM php:7-apache
MAINTAINER Donovan Tengblad

RUN apt-get update && apt-get install -y \
  zlib1g-dev \
  libpng12-dev \
  libjpeg-dev \
  libxml2-dev \
  unzip \
  zip \
  git \
  libicu-dev \
  libmcrypt-dev \
  mysql-client \
  g++ \
  && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo pdo_mysql mysqli zip gd xmlrpc intl mcrypt
RUN docker-php-ext-configure intl
RUN docker-php-ext-configure mcrypt
RUN a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN git clone -b master --single-branch https://github.com/chamilo/chamilo-lms.git /var/www/html

COPY files/parameters.yml app/config/parameters.yml
COPY files/php.ini /usr/local/etc/php/
COPY files/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
