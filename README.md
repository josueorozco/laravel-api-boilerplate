# Quickstart  
  
1. Install the latest version of Docker: [https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/).
2. Install the latest version of PHP Composer: [https://getcomposer.org/download/](https://getcomposer.org/download/).
3. Clone this repo: `git clone git@github.com:josueorozco/laravel-api-boilerplate.git`
4. Install dependencies: `php composer install`
5. Build Docker containers/images: `cd docker && docker-compose build`
6. Launch dev env: `docker-compose up -d`
7. Run DB Migrations: `php artisan migrate`
8. Run DB Seeders: `php artisan db:seed`
