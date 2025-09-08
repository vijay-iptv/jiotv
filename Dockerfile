FROM php:8.2-apache

# Set working directory
WORKDIR /var/www/html

# Copy project files
COPY ./ /var/www/html/

# Ensure data folder exists and is writable
RUN mkdir -p /var/www/html/app/assets/data \
    && chown -R www-data:www-data /var/www/html/app/assets/data \
    && chmod -R 775 /var/www/html/app/assets/data

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Allow .htaccess overrides
RUN sed -i '/<Directory \/var\/www\/html>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Expose HTTP port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
