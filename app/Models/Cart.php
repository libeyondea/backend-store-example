<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use \App\Http\Traits\UsesUuid;

    protected $table = 'cart';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = false;
    protected $guarded = [];

    public function ProductCart()
    {
    	return $this->hasMany('App\Models\ProductCart', 'cart_id', 'id');
    }

    public function Product()
    {
        return $this->belongsToMany('App\Models\Product', 'cart_product');
    }

    public function User()
    {
        return $this->belongsTo('App\Models\User', 'user_id', 'id');
    }
}
