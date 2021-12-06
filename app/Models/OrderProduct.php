<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderProduct extends Model
{
    use \App\Http\Traits\UsesUuid;

    protected $table = 'order_product';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = false;
    protected $guarded = [];

    public function Product()
    {
    	return $this->belongsTo('App\Models\Product', 'product_id', 'id');
    }

    public function Order()
    {
    	return $this->belongsTo('App\Models\Order', 'cart_id', 'id');
    }

}
