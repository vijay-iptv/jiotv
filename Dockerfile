FROM php:8.2-apache

# Set working directory to project root
WORKDIR /var/www/html

# Copy entire project
COPY ./ /var/www/html/

# Ensure data folder exists and is writable
RUN mkdir -p /var/www/html/app/assets/data \
    && chown -R www-data:www-data /var/www/html/app/assets/data \
    && chmod -R 775 /var/www/html/app/assets/data

# Enable mod_rewrite if needed
RUN a2enmod rewrite

# Expose Apache default port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
