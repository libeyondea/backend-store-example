<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class ProductCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    //public $collects = 'App\Http\Resources\ProductResource';

    public function toArray($request)
    {
        return [
            'success' => true,
            'data' => $this->collection->transform(function($product){
                return [
                    'id' => $product->id,
                    'title' => $product->title,
                    'meta_title' => $product->meta_title,
                    'meta_description' => $product->meta_description,
                    'slug' => $product->slug,
                    'excerpt' => $product->excerpt,
                    'quantity' => $product->quantity,
                    'price' => $product->price,
                    'discount' => $product->discount,
                    'published' => $product->published,
                    'published_at' => $product->published_at,
                    'created_at' => $product->created_at,
                    'updated_at' => $product->updated_at,
                    'category' => $product->category,
                    'brand' => $product->brand,
                    'tag' => $product->tag,
                    'product_image' => $product->productimage
                ];
            }),
            'pagination' => [
                'total' => $this->total(),
                'count' => $this->count(),
                'per_page' => $this->perPage(),
                'current_page' => $this->currentPage(),
                'total_pages' => $this->lastPage()
            ]
        ];
    }
}
