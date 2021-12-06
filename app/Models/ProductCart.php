<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductCart extends Model
{
    use \App\Http\Traits\UsesUuid;

    protected $table = 'cart_product';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = false;
    protected $guarded = [];

    public function Product()
    {
    	return $this->belongsTo('App\Models\Product', 'product_id', 'id');
    }

    public function Cart()
    {
    	return $this->belongsTo('App\Models\Cart', 'cart_id', 'id');
    }

}
