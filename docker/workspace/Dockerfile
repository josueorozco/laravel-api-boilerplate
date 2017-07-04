FROM php:7.1.4-fpm
MAINTAINER Josue Orozco <josueorozco@outlook.com>

##
# Update/install sources
RUN apt-get update && apt-get install -y --no-install-recommends && \
	rm -rf /var/lib/apt/lists/*

# Install extensions using the helper script provided by the base image
RUN docker-php-ext-install \
	pdo_mysql

##
# XDEBUG
ONBUILD ARG INSTALL_XDEBUG=false
ONBUILD ENV INSTALL_XDEBUG ${INSTALL_XDEBUG}
ONBUILD RUN if [ ${INSTALL_XDEBUG} = true ]; then \
	pecl install xdebug && \
	docker-php-ext-enable xdebug \
;fi

##
# Run composer global install, if required.
ONBUILD ARG COMPOSER_INSTALL=false
ONBUILD ARG COMPOSER_OAUTH_TOKEN=1e81a66189dca473a0e054917752d03eb4230b6b
ONBUILD ENV COMPOSER_INSTALL ${COMPOSER_INSTALL}
ONBUILD ENV COMPOSER_OAUTH_TOKEN ${COMPOSER_OAUTH_TOKEN}
ONBUILD RUN if [ ${COMPOSER_INSTALL} = true ]; then \
	##
	# Update/install sources
	apt-get update && apt-get install -y \
		zip \
		unzip \
		git \
		curl && \
		rm -rf /var/lib/apt/lists/* && \
		curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
		composer config --global github-oauth.github.com ${COMPOSER_OAUTH_TOKEN} \
;fi

CMD ["true"]
