FROM php:8.2-cli

# Работна директория
WORKDIR /var/www

# Инсталираме само нужното
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    && docker-php-ext-install opcache

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Копираме проекта
COPY . .

# Инсталираме PHP зависимостите
RUN composer install --no-dev --optimize-autoloader

# Railway използва този порт
ENV PORT=8080
EXPOSE 8080

# Стартираме Symfony (public/index.php)
CMD ["php", "-S", "0.0.0.0:8080", "public/router.php"]