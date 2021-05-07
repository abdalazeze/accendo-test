<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\HomeWorkController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::post('register', [RegisterController::class, 'register']);
Route::post('login', [RegisterController::class, 'login']);
Route::post('loginStudent', [RegisterController::class, 'loginStudent']);
Route::group(['middleware' => 'auth:api'], function() {
    Route::get('homeworksUser', HomeWorkController::class.'@index'); 
    Route::get('studentusers', HomeWorkController::class.'@getStudentsUsers'); 
    Route::post('homeworks', HomeWorkController::class.'@store'); 
    Route::put('homeworks/{id}', HomeWorkController::class.'@submitHomeWork');
    Route::get('homeworkssubmited', HomeWorkController::class.'@getHomeWorksSubmited');
});

