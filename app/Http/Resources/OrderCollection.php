<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;
use Carbon\Carbon;

class OrderCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'success' => true,
            'data' => $this->collection->transform(function($order){
                return [
                    'id' => $order->id,
                    'user_id' => $order->user_id,
                    'status' => $order->status,
                    'sub_total' => $order->sub_total,
                    'shipping' => $order->shipping,
                    'promo' => $order->promo,
                    'discount' => $order->discount,
                    'total' => $order->total,
                    'first_name' => $order->first_name,
                    'last_name' => $order->last_name,
                    'email' => $order->email,
                    'phone_number' => $order->phone_number,
                    'address' => $order->address,
                    'created_at' => $order->created_at,
                    'updated_at' => $order->updated_at,
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
