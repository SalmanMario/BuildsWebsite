FROM php:8.2-apache

# 1) deps de bază pt apt și PHP extensions
RUN apt-get update && apt-get install -y \
    git curl ca-certificates gnupg \
    libpng-dev libjpeg62-turbo-dev libfreetype6-dev \
    libonig-dev libxml2-dev libzip-dev zip unzip \
 && rm -rf /var/lib/apt/lists/*

# 2) Node 18 (npm vine inclus). Trebuie gnupg + ca-certificates instalate înainte!
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
 && apt-get update \
 && apt-get install -y nodejs \
 && rm -rf /var/lib/apt/lists/* \
 && node -v && npm -v

# 3) Extensii PHP (GD cu jpeg/freetype + pdo_mysql, mbstring, zip, bcmath etc.)
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install gd pdo_mysql mbstring xml zip bcmath exif pcntl

# 4) Composer din imaginea oficială
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# 5) Apache rewrite + vhost
RUN a2enmod rewrite
# (păstrăm conf-ul inline ca la tine)
RUN printf "<VirtualHost *:80>\n\
    DocumentRoot /var/www/html/public\n\
    <Directory /var/www/html/public>\n\
        AllowOverride All\n\
        Require all granted\n\
    </Directory>\n\
    ErrorLog \${APACHE_LOG_DIR}/error.log\n\
    CustomLog \${APACHE_LOG_DIR}/access.log combined\n\
</VirtualHost>\n" > /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/html

# 6) Cache corect pentru Composer (copiem întâi manifestele)
COPY composer.json composer.lock ./
RUN composer install --no-dev --prefer-dist --no-interaction --no-scripts --optimize-autoloader

# 7) Cache corect pentru npm (copiem întâi manifestele)
COPY package*.json ./
RUN npm ci

# 8) Copiem restul codului
COPY . .

# 9) Build frontend
RUN npm run build

# 10) Permisiuni Laravel
RUN chown -R www-data:www-data storage bootstrap/cache \
 && chmod -R 775 storage bootstrap/cache

# ⚠️ NU genera cheia și NU copia .env la build.
# Cheia o facem în post-deploy (vezi mai jos) pentru a nu fixa secrete în layer-ele imaginii.

EXPOSE 80
CMD ["apache2-foreground"]
