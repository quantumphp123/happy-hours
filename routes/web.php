<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Artisan;
use Symfony\Component\Process\Process;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/clear', function () {
    
    // $command = 'composer dump-autoload';

    // // Split the command into an array of arguments
    // $arguments = explode(' ', $command);

    // // Create a new Process object
    // $process = new Process($arguments);

    // // Start the process
    // $process->start();

    // // Read the output of the process in real-time
    // while ($process->isRunning()) {
    //     echo $process->getOutput();
    //     usleep(100);
    // }

    // // Check the exit code of the process
    // if (!$process->isSuccessful()) {
    //     return 'An error occurred while running the Composer command: '.$process->getExitCode();
    // }
    
    // $command = 'composer dump-autoload -o';

    // // Split the command into an array of arguments
    // $arguments = explode(' ', $command);

    // // Create a new Process object
    // $process = new Process($arguments);

    // // Start the process
    // $process->start();

    // // Read the output of the process in real-time
    // while ($process->isRunning()) {
    //     echo $process->getOutput();
    //     usleep(100);
    // }

    // // Check the exit code of the process
    // if (!$process->isSuccessful()) {
    //     return 'An error occurred while running the Composer command: '.$process->getExitCode();
    // }

    // Artisan::call('migrate');
    Artisan::call('clear-compiled');
    Artisan::call('optimize');
    Artisan::call('route:clear');
    Artisan::call('view:clear');
    Artisan::call('cache:clear');
    Artisan::call('config:cache');
    Artisan::call('config:clear');
});


Route::get('/privacy-policy', function () {
    return view('Website.privacy');
});
Route::get('/terms-conditions', function () {
    return view('Website.terms_and-condition');
});
Route::get('admin-login', [App\Http\Controllers\AdminController::class, 'index'])->name('admin-login');
// Route::get('generate-pdf', [App\Http\Controllers\AdminController::class, 'generatePDF'])->name('generate-pdf');
Route::post('admin-login-post', [App\Http\Controllers\AdminController::class, 'login_post'])->name('admin-login-post');


Route::group(['middleware'=>['adminBasicAuth']],function(){

    Route::get('admin-dashboard', [App\Http\Controllers\AdminController::class, 'admin_dashboard'])->name('admin-dashboard');
    
    /**user routes starts here*/
    Route::get('users', [App\Http\Controllers\AdminController::class, 'users'])->name('users');
    Route::get('viewUser/id/{id}', [App\Http\Controllers\AdminController::class, 'viewUser'])->name('viewUser');
    Route::get('delete-user/id/{id}', [App\Http\Controllers\AdminController::class, 'delete_user'])->name('deleteUser');
    Route::get('add-user', [App\Http\Controllers\AdminController::class, 'add_user'])->name('add-user');
    Route::post('post-add-user', [App\Http\Controllers\AdminController::class, 'post_add_user'])->name('post-add-user');
    /**user routes ends here*/
    
    /**category routes starts here */
    Route::get('category', [App\Http\Controllers\AdminController::class, 'category'])->name('category');
    Route::get('add-category', function () {
        return view('admin.category.add');
    });
    Route::post('post-add-category', [App\Http\Controllers\AdminController::class, 'postCategory'])->name('postCategory');
    Route::get('deleteCategory/id/{id}', [App\Http\Controllers\AdminController::class, 'deleteCategory'])->name('deleteCategory');
    /**category routes ends here */
    
    /**business routes starts here */
    Route::get('places', [App\Http\Controllers\AdminController::class, 'places'])->name('places');
    Route::get('add-place', [App\Http\Controllers\AdminController::class, 'addPlace'])->name('addPlace');
    Route::post('post-add-place', [App\Http\Controllers\AdminController::class, 'postPlace'])->name('postPlace');
    Route::get('deletePlace/{id}', [App\Http\Controllers\AdminController::class, 'deletePlace'])->name('deletePlace');
    Route::get('search/places', [App\Http\Controllers\AdminController::class, 'searchPlaces'])->name('search-places');
    Route::get('show/{id}', [App\Http\Controllers\AdminController::class, 'viewPlace'])->name('admin.place.show');
    /**business routes ends here */
    
    Route::post('change-status', [App\Http\Controllers\AdminController::class, 'change_status'])->name('change-status');
    
    /**review routes starts here */
    Route::get('reviews/{placeId}', [App\Http\Controllers\AdminController::class, 'reviews'])->name('reviews');
    Route::get('deleteReview/{id}/placeId/{placeId}', [App\Http\Controllers\AdminController::class, 'deleteReview'])->name('deleteReview');
    /**review routes ends here */
    
    Route::get('userModalContent/{id}', [App\Http\Controllers\AdminController::class, 'userModalContent'])->name('userModalContent');

});

Route::get('logout', [App\Http\Controllers\AdminController::class, 'logout'])->name('logout');
Route::group(['prefix'=>'user'], function(){
    Route::get('login', [UserController::class, 'login'])->name('user.login');
    Route::get('register', [UserController::class, 'register'])->name('register');
    Route::post('register/post', [UserController::class, 'register_post'])->name('register_post');
    Route::post('login/post', [UserController::class, 'login_post'])->name('user.login_post');

    //forgot password routes
    Route::get('forgot-password',[UserController::class,"forgotPassword"])->name('forget password');
    Route::post('forgot-sendmail',[UserController::class,"forgotSendMail"])->name('forget-sendmail');
    Route::get('password-reset/{token}',[UserController::class,"resetPassword"])->name('password-reset');
    Route::post('password-reset/post',[UserController::class,"resetPasswordSave"])->name('password-reset-post');

    Route::group(['middleware'=>['UserBasicAuth']],function(){
        Route::get('dashboard', [UserController::class, 'index'])->name('User.Dashboard');
        Route::get('chats', [UserController::class, 'chats'])->name('User.chat');
        Route::get('profile', [UserController::class, 'Profile'])->name('User.profile');
        Route::get('notifications', [UserController::class, 'Notifications'])->name('User.notifications');
        Route::get('change/Password', [UserController::class, 'change_pass'])->name('User.change_pass');
        Route::post('change/password/post', [UserController::class, 'change_pass_post'])->name('user.change_pass.post');
        Route::post('edit', [UserController::class, 'edit'])->name('user.edit');
        Route::get('Gallery', [UserController::class, 'gallery'])->name('User.gallery');
        Route::post('image/insert', [UserController::class, 'image_upload'])->name('image.upload');
        Route::get('image/delete/{id}', [UserController::class, 'ImageDelete'])->name('UserImage.Delete');
        Route::get('Offers', [UserController::class, 'Offers'])->name('UserOffers');
        Route::get('offer/create', [UserController::class, 'CreateOffer'])->name('offer.create');
        Route::post('offer/create', [UserController::class, 'OfferPost'])->name('Offer.post');
        Route::get('offer/delete/{id}', [UserController::class, 'OfferDelete'])->name('Offer.Delete');
        Route::get('notify/{id}', [UserController::class, 'notify'])->name('SendNotification');
        Route::get('notification/delete/{id}', [UserController::class, 'NotificationDelete'])->name('UserNotification.Delete');
        Route::get('availibilty/post', [UserController::class, 'Availability'])->name('Availability');
        Route::post('user-availability-post', [UserController::class, 'UseravailibilityPost'])->name('user-availability');
        Route::get('/availibilty',[UserController::class, 'Useravailibility'])->name('user.availability');
        Route::get('/categories',[UserController::class, 'UserCategories'])->name('user.categories');
        Route::get('/reviews',[UserController::class, 'UserReviews'])->name('user.reviews');
        Route::post('/categories/update',[UserController::class, 'UserCategoryUpdate'])->name('Category.update');
        Route::get('user/availibilty/status',[UserController::class, 'UserAvailibilityUpdate'])->name('update.availability');
        Route::get('user/availibilty/update/{id}',[UserController::class, 'UserAvailibilityUpdateTime'])->name('update.AvailabilityTime');
        Route::post('user/availibilty/edit',[UserController::class, 'UserAvailibilityEditTime'])->name('Availibility.Edit');
        Route::get('location/add', [UserController::class, 'CreateLocation'])->name('LocationCreate');
        Route::post('edit-pic',[UserController::class, 'EditProfilePic'])->name('edit-pic');

        Route::post('location/post', [UserController::class, 'PostLoaction'])->name('LocationPost');

        Route::get('logout', [UserController::class, 'logout'])->name('User.logout');
      
        Route::get('details',[UserController::class, 'UserDetails'])->name('user.details');
        Route::post('details',[UserController::class, 'UserDetailsUpdate'])->name('details.update');
        });


});

Route::get('/Glogin/redirect', function () {
    return Socialite::driver('google')->stateless()->redirect();
});
