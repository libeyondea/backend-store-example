<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Brand;
use JWTAuth;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\CategoryCollection;
use App\Http\Resources\BrandCollection;
use App\Http\Resources\RecursiveCategoryResource;

class CategoryController extends Controller
{
    public function fetchCategory()
    {
        $fetchCategory = new CategoryCollection(Category::orderBY('created_at', 'desc')->get());
        return response()->json(['success' => true, 'data' => $fetchCategory], 200);
    }

    public function fetchBrand()
    {
        $fetchBrand = new BrandCollection(Brand::orderBY('created_at', 'desc')->get());
        return response()->json(['success' => true, 'data' => $fetchBrand], 200);
    }

    public function fetchRecursiveCategory()
    {
        $fetchRecursiveCategory = RecursiveCategoryResource::collection(Category::whereNull('parent_id')
                                                            ->orderBY('created_at', 'desc')->get());
        return response()->json(['success' => true, 'data' => $fetchRecursiveCategory], 200);
    }

    public function singleCategory($id) {
        $singleCategory = new CategoryResource(Category::where('id', $id)->firstOrFail());
        return response()->json(['success' => true, 'data' => $singleCategory], 200);
    }
}
