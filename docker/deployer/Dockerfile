FROM php:7.1-cli

RUN apt-get update && \
  apt-get install -y \
    curl \
    git \
    zip \
    unzip

RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin
