<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Product;
use App\Models\PostTag;
use App\Models\Tag;
use App\Models\PostCategory;
use App\Models\Category;
use App\Models\User;
use JWTAuth;
use Carbon\Carbon;
use App\Http\Resources\ProductResource;
use App\Http\Resources\ProductCollection;

class ProductController extends Controller
{
    public function fetchProduct(Request $request)
    {
        /* $fetchPost = new ProductCollection(Product::all());
        return response()->json(['success' => true, 'data' => $fetchPost], 200); */

        $per_page = (int) $request->per_page;
        $fetchProduct = new ProductCollection(Product::paginate($per_page));
        return response()->json($fetchProduct, 200);
    }

    public function singleProduct($id)
    {
        $product = new ProductResource(Product::where('id', $id)->first());
        return response()->json(['success' => true, 'data' => $product], 200);
    }

    public function relatedProduct(Request $request)
    {
        $per_page = (int) $request->per_page;
        $product = Product::where('id', $request->id)->first();
        $relatedProduct = new ProductCollection(Product::where('category_id', $product->category_id)->paginate($per_page));
        return response()->json($relatedProduct, 200);
    }
}
