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

## API Teacher Specification

The api can be accessed at [http://localhost:8000/api](http://localhost:8000/api).

Request headers

| **Required** 	| **Key**              	| **Value**            	|
|----------	|------------------	|------------------	|
| Yes      	| Content-Type     	| application/json 	|
| Yes 	    | Authorization    	| Bearer {token} |


For Api End points You can check folders for postman collections And this is the links 

## Endpoints Teacher App:

### Authentication:

    POST http://127.0.0.1:8000/api/login

Example request body form-data:

    email: {email}
    password:{password}

### Registration:

    POST http://127.0.0.1:8000/api/register

Example request body form-data:

    name:{name}
    username:{username}
    email: {email}
    password:{password}
    c_password:{c_password}
    role:teacher

### Get Students Users:

    GET http://127.0.0.1:8000/api/studentusers

### Create HomeWork:

    POST http://127.0.0.1:8000/api/homeworks

Example request body form-data:

    name:{name}
    description:{description}
    student_id[]:{student_id}
    student_id[]:{student_id}

### Get HomeWorks Submited:

    GET http://127.0.0.1:8000/api/homeworkssubmited



## Student app

Now Switch to the repo student folder

    cd student-app

Install all the dependencies using composer

    composer install

Next, you should to make port for teacher app as 8080 in .env file.

    SERVER_PORT=8080

Start the local development server

    php artisan serve

You can now access the server at http://localhost:8080

## API Student Specification

The api can be accessed at [http://localhost:8080/api](http://localhost:8080/api).

Request headers

| **Required** 	| **Key**              	| **Value**            	|
|----------	|------------------	|------------------	|
| Yes      	| Content-Type     	| application/json 	|
| Yes 	    | Authorization    	| Bearer {your_token} |


For Api End points You can check folders for postman collections And this is the links 

## Endpoints Student App:

### Authentication:

    POST http://127.0.0.1:8080/api/login

Example request body form-data:

    email: {email}
    password:{password}

### Registration:

    POST http://127.0.0.1:8080/api/register

Example request body form-data:

    name:{name}
    username:{username}
    email: {email}
    password:{password}
    c_password:{c_password}
    role:student

### Get My Homeworks:

    GET http://127.0.0.1:8080/api/homeworksUser

### Submit HomeWork:

    Put http://127.0.0.1:8080/api/homeworks{id}


