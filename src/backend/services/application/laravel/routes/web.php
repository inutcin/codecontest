<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

$router->get('/user/login', 
    ["uses" => UserController::class.'@login_form']
)->name("login");

$router->post('/user/login', ["uses" => UserController::class.'@login']);

$router->get('/', function () {
    return view('welcome');
});

