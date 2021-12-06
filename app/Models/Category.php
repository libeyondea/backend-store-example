<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = 'category';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = false;
    protected $guarded = [];

    public function Product()
    {
        return $this->hasMany('App\Models\Product', 'category_id', 'id');
    }

    public function ChildrenCategory()
    {
    	return $this->hasMany('App\Models\Category', 'parent_id', 'id');
    }
}
