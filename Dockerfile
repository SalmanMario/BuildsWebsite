FROM php:8.2-apache

# Instalează dependințele sistem
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    nodejs \
    npm

# Curăță cache-ul
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Instalează extensiile PHP necesare
RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# Instalează Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Setează directorul de lucru
WORKDIR /var/www/html

# Copiază fișierele proiectului
COPY . .

# Instalează dependințele PHP
RUN composer install --no-dev --optimize-autoloader

# Instalează dependințele Node.js și build
RUN npm install
RUN npm run build

# Setează permisiunile
RUN chown -R www-data:www-data /var/www/html/storage
RUN chmod -R 775 /var/www/html/storage

# Generează cheia aplicației
RUN php artisan key:generate --force

# Configurează Apache
RUN a2enmod rewrite
COPY .docker/apache.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80
