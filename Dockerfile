FROM php:7-alpine

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN apk add -q --update curl git zip autoconf alpine-sdk sqlite-dev && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install pdo_sqlite && \
    apk del autoconf alpine-sdk sqlite-dev && \
    rm -rf /var/cache/apk/* && \
    curl -sS https://getcomposer.org/installer | php && \
    echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini && \
    echo "date.timezone=${PHP_TIMEZONE:-UTC}" > $PHP_INI_DIR/conf.d/date_timezone.ini && \
    chmod +x composer.phar && \
    mv composer.phar /usr/local/bin && \
    ln -s /usr/local/bin/composer /usr/local/bin/composer.phar && \
    composer -V && \
    composer.phar global -q require "hirak/prestissimo:^0.3"

ENV PATH /root/.composer/vendor/bin:$PATH
