# accendo-test
Accendo Test Api Edu have 2 app teacher and student.

## Installation

Clone accendo-test repository or download as zip file

    git clone git@github.com:abdalazeze/accendo-test.git

Switch to the repo folder

    cd teacher-app

Install all the dependencies using composer

    composer install

Run the database migrations (**Set the database connection in .env before migrating**)

    php artisan migrate

Next, you should execute the passport:install Artisan command.

    php artisan passport:install