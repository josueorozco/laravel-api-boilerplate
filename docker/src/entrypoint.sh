#!/bin/bash

#/*
#|--------------------------------------------------------------------------
#| Init Directories
#|--------------------------------------------------------------------------
#|
#| Set directories we will manipulate.
#|
#*/

DIR_VENDOR=/var/www/laravel.local/vendor
DIR_STORAGE=/var/www/laravel.local/storage

#/*
#|--------------------------------------------------------------------------
#| Laravel Migrate DB
#|--------------------------------------------------------------------------
#|
#| Wait for arrl-mysql container to be ready, then execute laravel's migrate
#| command.
#|
#*/

while ! mysqladmin ping -h${DB_HOST:=api-mysql} --silent; do
	sleep 1
done
>&2 echo "Database is up - executing artisan migrate command:"

#/*
#|--------------------------------------------------------------------------
#| Main script!
#|--------------------------------------------------------------------------
#|
#| Check environment, and execute post processes.
#|
#*/

if [ ${APP_ENV:=local} = 'production' ]; then
	php artisan migrate --force;
else
	php artisan migrate:refresh --seed --force;
fi
