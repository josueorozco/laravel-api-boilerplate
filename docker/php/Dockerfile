FROM josueorozco/laravel-api-boilerplate:workspace
MAINTAINER Josue Orozco <josueorozco@outlook.com>

##
# Add conf files.
ADD ./laravel.ini /usr/local/etc/php/conf.d
ADD ./laravel.pool.conf /usr/local/etc/php-fpm.d/

##
# Set permissions
RUN usermod -u 1000 www-data

##
# Expose fpm port
EXPOSE 9000

##
# Init command
CMD ["php-fpm"]
