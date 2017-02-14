FROM php:7-apache
MAINTAINER Donovan Tengblad

RUN apt-get update && apt-get install -y \
  zlib1g-dev \
  libpng12-dev \
  libjpeg-dev \
  libxml2-dev \
  unzip \
  zip \
  libicu-dev \
  g++ \
  && rm -rf /var/lib/apt/lists/*

# Moodle download & installation.
ADD https://download.moodle.org/moodle/moodle-latest.tgz /var/www/html/moodle-latest.tgz
RUN cd /var/www/html; tar zxvf moodle-latest.tgz --strip 1
RUN rm /var/www/html/moodle-latest.tgz
RUN chown -R www-data:www-data /var/www/html
RUN mkdir -p /var/moodledata
RUN chown -R www-data:www-data /var/moodledata; chmod 777 /var/moodledata

RUN docker-php-ext-install pdo pdo_mysql mysqli zip gd xmlrpc intl
RUN docker-php-ext-configure intl

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
