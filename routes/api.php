<?php

use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::get("/auth", function (\Illuminate\Http\Request $request) {
    return $request->user();
});

Route::middleware("auth:sanctum")->group(function () {
   Route::get("/user", [UserController::class, "index"]);
});

//Route::post("/admin/login", [\Laravel\Fortify\Http\Controllers\AuthenticatedSessionController::class, "store"]);
