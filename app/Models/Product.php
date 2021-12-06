<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    //use \App\Http\Traits\UsesUuid;

    protected $table = 'product';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = false;
    protected $guarded = [];

    public function ProductTag()
    {
    	return $this->hasMany('App\Models\ProductTag', 'product_id', 'id');
    }

    public function Tag()
    {
        return $this->belongsToMany('App\Models\Tag', 'product_tag');
    }

    public function ProductCart()
    {
    	return $this->hasMany('App\Models\ProductCart', 'product_id', 'id');
    }

    public function Cart()
    {
        return $this->belongsToMany('App\Models\Cart', 'cart_product');
    }

    public function OrderProduct()
    {
    	return $this->hasMany('App\Models\OrderProduct', 'product_id', 'id');
    }

    public function Order()
    {
        return $this->belongsToMany('App\Models\Order', 'order_product');
    }

    public function Category()
    {
        return $this->belongsTo('App\Models\Category', 'category_id', 'id');
    }

    public function Brand()
    {
        return $this->belongsTo('App\Models\Brand', 'brand_id', 'id');
    }

    public function ProductImage()
    {
    	return $this->hasMany('App\Models\ProductImage', 'product_id', 'id');
    }

    public function Comment()
    {
    	return $this->hasMany('App\Models\Comment', 'post_id', 'id');
    }

}
