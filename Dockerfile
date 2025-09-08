FROM php:8.2-apache

# Set working directory
WORKDIR /var/www/html

# Copy app files
COPY ./ /var/www/html/

# Ensure data folder exists and is writable
RUN mkdir -p /var/www/html/assets/data \
    && chown -R www-data:www-data /var/www/html/assets/data \
    && chmod -R 777 /var/www/html/assets/data

# Enable mod_rewrite if needed
RUN a2enmod rewrite

# Optional: expose default Apache port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]