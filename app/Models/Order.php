<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use \App\Http\Traits\UsesUuid;

    protected $table = 'order';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = false;
    protected $guarded = [];

    public function OrderProduct()
    {
    	return $this->hasMany('App\Models\OrderProduct', 'order_id', 'id');
    }

    public function Product()
    {
        return $this->belongsToMany('App\Models\Product', 'order_product');
    }

    public function User()
    {
        return $this->belongsTo('App\Models\User', 'user_id', 'id');
    }
}
