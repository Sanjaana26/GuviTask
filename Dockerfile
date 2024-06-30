# Use the official PHP image as the base image
FROM php:8.1-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libzip-dev \
    unzip \
    && docker-php-ext-install pdo_pgsql zip

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy application source code to the container
COPY . .

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install application dependencies
RUN composer install

# Copy custom Apache configuration
COPY ./apache-config.conf /etc/apache2/sites-available/000-default.conf

# Expose port 80
EXPOSE 80

# Start Apache server
CMD ["apache2-foreground"]