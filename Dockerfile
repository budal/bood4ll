ARG PHP_VERSION=8.1-fpm
FROM php:${PHP_VERSION}

ARG APP_DIR=/var/www/80
ARG REDIS_LIB_VERSION=5.3.7

RUN apt update && apt install -y --no-install-recommends apt-utils supervisor

COPY ./docker/supervisord/supervisord.conf /etc/supervisor
COPY ./docker/supervisord/conf /etc/supervisord.d/

RUN apt install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    zlib1g-dev \
    libzip-dev \
    libpq-dev

RUN docker-php-ext-install pdo pdo_mysql pdo_pgsql pgsql session xml mbstring exif bcmath zip iconv simplexml pcntl gd fileinfo

RUN pecl install redis-${REDIS_LIB_VERSION} && docker-php-ext-enable redis 

RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

RUN apt install -y nginx

ARG USER=bood4ll
ARG UID=1000

RUN useradd -G www-data,root -u $UID -d /home/${USER} ${USER}
RUN mkdir -p /home/${USER}/.composer && \
    chown -R ${USER}:${USER} /home/${USER}

RUN apt clean && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash -
RUN apt install -y nodejs

# COPY ./docker/nginx/nginx.conf /etc/nginx/nginx.conf
# COPY ./docker/nginx/sites /etc/nginx/sites-available

# COPY ./applications /var/www

# RUN chmod 755 -R /var/www
# RUN chown -R www-data: /var/www

WORKDIR ${APP_DIR}

# RUN composer install
# RUN cp .env.example .env
# RUN php artisan key:generate
# RUN chmod -R 777 storage
# RUN npm install
# RUN php artisan migrate --seed

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]