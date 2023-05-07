<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\CategoriaController;
use App\Http\Controllers\API\ProductoController;
use App\Http\Controllers\API\CaracteristicaController;
use App\Http\Controllers\API\ProductDetailController;


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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('productodetalle',[ProductDetailController::class,'index']);
Route::post('productodetalle',[ProductDetailController::class,'store']);
Route::get('productodetalle/{id}',[ProductDetailController::class,'show']);
Route::put('productodetalle/{id}',[ProductDetailController::class,'update']);
Route::delete('productodetalle/{id}',[ProductDetailController::class,'destroy']);

//Route::apiResource('productodetalle',ProductDetailController::class);



Route::get('categorias',[CategoriaController::class,'index']);
Route::post('categorias',[CategoriaController::class,'store']);
Route::get('categorias/{id}',[CategoriaController::class,'show']);
Route::put('categorias/{id}',[CategoriaController::class,'update']);
Route::delete('categorias/{id}',[CategoriaController::class,'destroy']);

Route::get('productos',[ProductoController::class,'index']);
Route::post('productos',[ProductoController::class,'store']);
Route::get('productos/{id}',[ProductoController::class,'show']);
Route::put('productos/{id}',[ProductoController::class,'update']);
Route::delete('productos/{id}',[ProductoController::class,'destroy']);

/*
Route::get('caracteristicas',[CaracteristicaController::class,'index']);
Route::post('caracteristicas',[CaracteristicaController::class,'store']);
Route::get('caracteristicas/{id}',[CaracteristicaController::class,'show']);
Route::put('caracteristicas/{id}',[CaracteristicaController::class,'update']);
Route::delete('caracteristicas/{id}',[CaracteristicaController::class,'destroy']);
*/