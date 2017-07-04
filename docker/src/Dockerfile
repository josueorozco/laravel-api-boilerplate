FROM josueorozco/laravel-api-boilerplate:workspace
MAINTAINER Josue Orozco <josueorozco@outlook.com>

##
# Update/install sources
RUN apt-get update && apt-get install -y --no-install-recommends \
	mysql-client && \
	rm -rf /var/lib/apt/lists/*

##
# Entrypoint Setup
COPY docker/src/entrypoint.sh /usr/local/bin/entrypoint.sh

##
# Set working directory
WORKDIR /var/www/laravel.local

##
# Run Composer Install
ARG APP_ENV=local
ENV APP_ENV ${APP_ENV}
RUN if [ ${COMPOSER_INSTALL} = true ]; then \
	if [ ${APP_ENV} = 'production' ]; then \
		composer install --no-dev --prefer-dist --optimize-autoloader --working-dir=/var/www/laravel.local \
	;else \
		composer install --working-dir=/var/www/laravel.local \
	;fi \
;fi

##
# Enable entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
