FROM php:8.2-fpm

MAINTAINER davojan

#RUN sed -i "s/deb.debian.org/ftp.deb.debian.org/g" /etc/apt/sources.list.d/debian.sources
RUN apt-get update && \
        apt-get install -y \
        nginx \
        libpq-dev \
        libmemcached-dev \
        curl \
        sudo \
        libjpeg-dev \
        libpng-dev \
        libfreetype6-dev \
        libssl-dev \
        libmcrypt-dev \
        libzip-dev \
        zip \
        tzdata \
        bzip2 \
        libzip-dev \
        libbz2-dev \
        libxml2-dev \
        procps \
        imagemagick \
        libmagickwand-dev \
        --no-install-recommends \
    && rm -r /var/lib/apt/lists/* \
    && unlink /etc/localtime \                                     
    && ln -s /usr/share/zoneinfo/UTC /etc/localtime
RUN \
    docker-php-ext-configure gd \
        --with-jpeg \
        --with-freetype
RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis \
    && pecl install imagick \
    && docker-php-ext-enable imagick
RUN \
    docker-php-ext-install \
        pgsql \
        pdo \
        pdo_pgsql \
        opcache \
        zip \
        bz2 \
        soap \
        xml \
        zip \
        bcmath \
        sockets \
        gd

COPY ./etc/php /etc/php
COPY ./bin/app.sh /app.sh
COPY ./etc/nginx /etc/nginx

ARG HOST_UID
ENV HOST_UID=${HOST_UID}
RUN echo ${HOST_UID}
RUN usermod -u ${HOST_UID} www-data

 


