<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'meta_title' => $this->meta_title,
            'meta_description' => $this->meta_description,
            'slug' => $this->slug,
            'excerpt' => $this->excerpt,
            'quantity' => $this->quantity,
            'price' => $this->price,
            'discount' => $this->discount,
            'published' => $this->published,
            'published_at' => $this->published_at,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'category' => $this->category,
            'brand' => $this->brand,
            'tag' => $this->tag,
            'product_image' => $this->productimage
        ];
    }
}
