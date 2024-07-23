# Menggunakan image PHP resmi
FROM php:8.0-apache

# Mengatur direktori kerja
WORKDIR /var/www/html

# Menyalin file aplikasi ke image
COPY . /var/www/html

# Menyalin file Composer ke image
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Menginstal dependensi menggunakan Composer
RUN composer install

# Mengexpose port 80 untuk aplikasi
EXPOSE 80

# Menjalankan server Apache
CMD ["apache2-foreground"]
