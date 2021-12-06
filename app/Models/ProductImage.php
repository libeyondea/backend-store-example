<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductImage extends Model
{
    //use \App\Http\Traits\UsesUuid;

    protected $table = 'product_image';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = false;
    protected $guarded = [];

    public function Product()
    {
    	return $this->belongsTo('App\Models\Product', 'product_id', 'id');
    }
}
