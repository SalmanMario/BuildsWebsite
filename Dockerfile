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

# Copiază DOAR fișierele necesare pentru instalarea dependințelor
COPY composer.json composer.lock* package.json package-lock* ./

# Instalează dependințele PHP (dacă există composer.lock)
RUN if [ -f composer.lock ]; then composer install --no-dev --optimize-autoloader; else composer install --no-dev --optimize-autoloader --no-scripts; fi

# Copiază restul fișierelor
COPY . .

# Instalează dependințele Node.js și build
RUN npm install
RUN npm run build

# Setează permisiunile
RUN chown -R www-data:www-data storage bootstrap/cache
RUN chmod -R 775 storage bootstrap/cache

# Generează cheia aplicației (dacă nu există)
RUN if [ ! -f .env ]; then \
        cp .env.example .env && \
        php artisan key:generate --force; \
    else \
        php artisan key:generate --force; \
    fi

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
