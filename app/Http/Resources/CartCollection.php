<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;
use Carbon\Carbon;

class CartCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return $this->collection->transform(function($cart){
            return [
                'id' => $cart->id,
                'user_id' => $cart->user_id,
                'created_at' => $cart->created_at,
                'updated_at' => $cart->updated_at,
                'product_cart' => ProductCartResource::collection($cart->productcart)
            ];
        });
    }
}
