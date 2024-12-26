FROM php:7.4-fpm

RUN apt-get update && \
    apt-get install -y nginx zlib1g-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev && \
    mkdir -p /run/nginx

RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \ 
    docker-php-ext-install mysqli bcmath gd pdo_mysql && \
    docker-php-ext-enable mysqli bcmath gd pdo_mysql 

RUN apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

RUN chmod 777 ./ && \
    chmod -R 777 ./public && \
    chmod -R 777 ./runtime

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["sh", "-c", "php-fpm & nginx -g 'daemon off;'"]