FROM php:8.2-apache

# Set working directory
WORKDIR /var/www/html

# Copy app files
COPY ./ /var/www/html/

# Ensure data folder exists and is writable
RUN mkdir -p /var/www/html/assets/data \
    && chown -R www-data:www-data /var/www/html/assets/data \
    && chmod -R 777 /var/www/html/assets/data

# Revert to default port 80
RUN sed -i 's/10000/80/' /etc/apache2/ports.conf && \
    sed -i 's/10000/80/' /etc/apache2/sites-available/000-default.conf

EXPOSE 80

# Enable mod_rewrite if needed
RUN a2enmod rewrite

# Start Apache
CMD ["apache2-foreground"]