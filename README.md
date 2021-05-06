# accendo-test
Accendo Test Api Edu have 2 app teacher and student with laravel 8.

## Installation

Clone accendo-test repository or download as zip file

    git clone git@github.com:abdalazeze/accendo-test.git

## Teacher app

Switch to the repo teacher folder

    cd teacher-app

Install all the dependencies using composer

    composer install

Run the database migrations (**Set the database connection in .env before migrating**)

    php artisan migrate

Next, you should execute the passport:install Artisan command.

    php artisan passport:install

**Make sure you set the correct database connection information before running the migrations** [Environment variables](#environment-variables)

Next, you should to make port for teacher app as 8000 in .env file.

    SERVER_PORT=8000

    php artisan migrate
    php artisan serve

## Database seeding

Run the database seeder and you're done

    php artisan db:seed

You can now access the server at http://localhost:8000

## Student app

Now Switch to the repo student folder

    cd student-app

Install all the dependencies using composer

    composer install

Next, you should to make port for teacher app as 8080 in .env file.

    SERVER_PORT=8080

Start the local development server

    php artisan serve

