<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\User;
use App\Models\Order;
use App\Http\Resources\ProductCollection;
use App\Http\Resources\OrderCollection;
use App\Http\Resources\UserCollection;
use JWTAuth;


class AdminController extends Controller
{
    public function fetchProduct(Request $request)
    {
        $per_page = (int) $request->per_page;
        $fetchProduct = new ProductCollection(Product::paginate($per_page));
        return response()->json($fetchProduct, 200);
    }

    public function fetchUser(Request $request)
    {
        $per_page = (int) $request->per_page;
        $fetch = new UserCollection(User::paginate($per_page));
        return response()->json($fetch, 200);
    }
    public function fetchOrder(Request $request)
    {
        $per_page = (int) $request->per_page;
        $fetch = new OrderCollection(Order::paginate($per_page));
        return response()->json($fetch, 200);
    }

}
