<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\ApiController;
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
#Normal Sign UP and LOGIN
Route::post('signup', [ApiController::class, 'signup'])->name('signup');
Route::post('login', [ApiController::class, 'login'])->name('login');
Route::post('password/otp', [ApiController::class, 'ForgotPass_otp']);
Route::post('verify/otp', [ApiController::class, 'verify_otp']);
Route::post('reset/password', [ApiController::class, 'changepassword']);
Route::get('get-categories', [ApiController::class, 'getCategoryList']);



#Social Logins
Route::post('Glogin', [App\Http\Controllers\API\SocialController::class, 'Glogin'])->name('Glogin');
Route::post('Flogin',[App\Http\Controllers\API\SocialController::class,'Flogin'])->name('Flogin');

Route::middleware('auth:sanctum')->group(function () {
    Route::get('places', [ApiController::class, 'getPlaces'])->name('getPlaces');
    Route::post('getProfile', [ApiController::class, 'getProfile'])->name('getProfile');
    Route::post('updateProfile', [ApiController::class, 'updateProfile'])->name('updateProfile');    
    Route::post('placeDetail', [ApiController::class, 'placeDetail'])->name('placeDetail');
    Route::post('addReview', [ApiController::class, 'addReview'])->name('addReview');
    Route::post('placeReviews', [ApiController::class, 'placeReviews'])->name('placeReviews');
    Route::post('addToFavourite', [ApiController::class, 'addToFavourite'])->name('addToFavourite');
    Route::post('removeFromFavourite', [ApiController::class, 'removeFromFavourite'])->name('removeFromFavourite');
    Route::post('getFavourite', [ApiController::class, 'getFavourite'])->name('getFavourite');
    Route::post('notification', [ApiController::class, 'notification'])->name('notification');
    Route::post('placesWithOffers', [ApiController::class, 'placesWithOffers'])->name('placesWithOffers');
    Route::post('homepage', [ApiController::class, 'homepage'])->name('homepage');
    Route::post('password/update', [ApiController::class, 'updatePass'])->name('updatePass');
    Route::post('filter', [ApiController::class, 'filter'])->name('filter');

    Route::post('ViewAllCategory',[ApiController::class, 'ViewAllCategory']);

    Route::post('DeleteAccount',[ApiController::class, 'DeleteAccount']);
    Route::delete('/users/{id}', [ApiController::class, 'destroy']);
    Route::delete('/userDelete', [ApiController::class, 'destroy_user']);
    
    
    
});