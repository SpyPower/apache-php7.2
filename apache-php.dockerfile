FROM php:7.2-apache

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        librabbitmq-dev \
        libssh-dev \
        libpng-dev \
        libmagickwand-dev \
        libc-client-dev \
        libkrb5-dev \
        zlib1g-dev \
        libz-dev \
        libmemcached-dev \
        libmemcached11 \
        libmemcachedutil2 \
        build-essential \
        memcached \
        libcurl4-openssl-dev \
        libssh2-1-dev \
        libtidy-dev \
        libxslt-dev \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install \
        bcmath \
        sockets \
        calendar \
        exif \
        gd \
        gettext \
        imap \
        intl \
        mysqli \
        pcntl \
        pdo_mysql \
        shmop \
        soap \
        sysvmsg \
        sysvsem \
        sysvshm \
        tidy \
        wddx \
        xsl \
        opcache \
        zip \
    && pecl install \
        amqp \
        igbinary \
        imagick \
        memcache \
        memcached \
        msgpack \
        propro \
        raphf \
        ssh2-1.1.2 \
    && docker-php-ext-enable \
        amqp \
        igbinary \
        imagick \
        memcache \
        memcached \
        msgpack \
        raphf \
        propro \
        ssh2 \
    && pecl install pecl_http && docker-php-ext-enable http

EXPOSE 8080
