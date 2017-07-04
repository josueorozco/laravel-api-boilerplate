FROM nginx:latest
MAINTAINER Josue Orozco <josueorozco@outlook.com>

##
# Add conf files.
ADD nginx.conf /etc/nginx/
ADD laravel.conf /etc/nginx/sites-available/

##
# Add PHP upstream
RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

##
# Set permissions
RUN usermod -u 1000 www-data

##
# Expose http, https
EXPOSE 80 443

##
# Run
CMD ["nginx"]
