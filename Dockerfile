FROM php:8.2-apache

# Instalează extensiile PHP necesare
RUN docker-php-ext-install pdo pdo_mysql

# Instalează Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Instalează Node.js și npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

# Setează directorul de lucru
WORKDIR /var/www/html

# Copiază fișierele proiectului
COPY . .

# Instalează dependințele PHP și JS
RUN composer install --no-dev --optimize-autoloader
RUN npm install
RUN npm run build

# Configurează Apache
RUN a2enmod rewrite
COPY .docker/apache.conf /etc/apache2/sites-available/000-default.conf

# Setează permisiunile
RUN chown -R www-data:www-data /var/www/html/storage
RUN chmod -R 775 /var/www/html/storage

EXPOSE 80
