FROM php:8.2-apache

# Instalează dependințele sistem
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Instalează Node.js separat
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs npm

# Curăță cache-ul
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Instalează extensiile PHP necesare
RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# Instalează Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Setează directorul de lucru
WORKDIR /var/www/html

# Copiază toate fișierele
COPY . .

# Instalează dependințele PHP (simplificat)
RUN composer install --no-dev --optimize-autoloader --no-scripts

# Instalează dependințele Node.js
RUN npm install
RUN npm run build

# Setează permisiunile
RUN chown -R www-data:www-data storage bootstrap/cache
RUN chmod -R 775 storage bootstrap/cache

# Generează cheia aplicației
RUN cp .env.example .env
RUN php artisan key:generate --force

# Configurează Apache
RUN a2enmod rewrite
RUN echo "<VirtualHost *:80>\n\
    DocumentRoot /var/www/html/public\n\
    <Directory /var/www/html/public>\n\
        AllowOverride All\n\
        Require all granted\n\
    </Directory>\n\
</VirtualHost>" > /etc/apache2/sites-available/000-default.conf

EXPOSE 80

# Pornește Apache
CMD ["apache2-foreground"]
