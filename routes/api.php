<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\TagController;
use App\Http\Controllers\Api\CommentController;
use App\Http\Controllers\Api\CartController;
use App\Http\Controllers\Api\AdminController;


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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => ['jwt.auth', 'api-header']], function () {
    // all routes to protected resources are registered here
    Route::post('posts', [PostController::class, 'createPost']);
    Route::get('posts/{id}/edit', [PostController::class, 'editPost']);
    Route::put('posts/{id}', [PostController::class, 'updatePost']);
    Route::delete('posts/{id}', [PostController::class, 'deletePost']);
    // Comment
    Route::post('comments/{id}', [CommentController::class, 'createComment']);
    Route::post('comments/reply/{id}', [CommentController::class, 'createReplyComment']);
    // Cart
    Route::get('carts', [CartController::class, 'fetchCart']);
    Route::post('add-to-carts', [CartController::class, 'addToCart']);
    Route::post('delete-cart-item', [CartController::class, 'deleteCartItem']);
    Route::post('checkout', [CartController::class, 'checkout']);
});

Route::group(['middleware' => 'api-header'], function () {
    // The registration and login requests doesn't come with tokens
    // as users at that point have not been authenticated yet
    // Therefore the jwtMiddleware will be exclusive of them
    Route::post('users/login', [AuthController::class, 'login']);
    Route::post('users/register', [AuthController::class, 'register']);
    // Products
    Route::get('products', [ProductController::class, 'fetchProduct']);
    Route::get('products/{id}', [ProductController::class, 'singleProduct']);
    Route::get('related-products', [ProductController::class, 'relatedProduct']);
    // Tags
    Route::get('tags', [TagController::class, 'fetchTag']);
    Route::get('tags/{id}', [TagController::class, 'singleTag']);
    // Categories
    Route::get('categories', [CategoryController::class, 'fetchCategory']);
    Route::get('recursive-categories', [CategoryController::class, 'fetchRecursiveCategory']);
    Route::get('categories/{id}', [CategoryController::class, 'singleCategory']);
    // Brand
    Route::get('brands', [CategoryController::class, 'fetchBrand']);
    // Comments
    Route::get('comments/{id}', [CommentController::class, 'fetchComment']);
    // Users
    Route::get('users', [AuthController::class, 'fetchUser']);
    Route::get('users/{id}/{user_name}', [AuthController::class, 'singleUser']);


    // Test admin
    Route::get('admin/products', [AdminController::class, 'fetchProduct']);
    Route::get('admin/users', [AdminController::class, 'fetchUser']);
    Route::get('admin/orders', [AdminController::class, 'fetchOrder']);
});
