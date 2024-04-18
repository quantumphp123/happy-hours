<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Place_category extends Model
{
    use HasFactory;
    protected $table='place_categories';
    
    public function category(){
        return $this->belongsTo(Category::class, 'category_id');
    }
}
