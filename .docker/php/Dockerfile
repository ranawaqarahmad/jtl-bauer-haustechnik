FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libcurl4-openssl-dev \
    libzip-dev \
    libxml2-dev \
    libonig-dev \
    libicu-dev \
    libsodium-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        gd \
        curl \
        mbstring \
        zip \
        pdo_mysql \
        intl \
        xml \
        bcmath \
        opcache \
        soap \
        dom \
        fileinfo \
        sodium \
        exif \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html
