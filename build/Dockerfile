FROM php:8.2-apache

# system updates
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install curl git zip zlib1g-dev libpng-dev libjpeg62-turbo-dev libfreetype6-dev libcurl4-openssl-dev libonig-dev libzip-dev

# install necessary PHP extensions
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install curl
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install zip
RUN docker-php-ext-install opcache

RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd

# enable some Apache modules
RUN a2enmod rewrite headers

# copy over configuration files
COPY config/php.ini /usr/local/etc/php/
COPY config/default.conf /etc/apache2/sites-enabled/

# copy scripts
WORKDIR /scripts
COPY scripts .
RUN chmod +x *

# adjust www-data user to reflect outside configuration
ARG WWWDATA_USER_ID
RUN usermod -u $WWWDATA_USER_ID www-data

# prepare ProcessWire
ARG PROCESSWIRE_VERSION
WORKDIR /var/www/html
RUN /scripts/install.sh $PROCESSWIRE_VERSION

# expose web port
EXPOSE 80

CMD ["/scripts/run.sh"]
