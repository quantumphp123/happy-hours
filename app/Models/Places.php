<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Places extends Model
{
    use HasFactory;
    protected $fillable = [
        "id",
        "placeName",
        "mobile",
        "business_owner_type",
        "business_owner_name",
        "location",
        "longitude",
        "lattitude",
        "ratings",
        "services",
        "website",
        "image",
        "description",
        "status",
        "address",
        "marketing_phone",
        "marketing_email",
        "marketing_name",
        "created_at",
        "updated_at",
        "email",
        "password",
        "streetname",
        "streetnumber",
        "zipcode",
        "city",
        "landmark",
    ];
    protected $table="places";
    protected $hidden = [
        'password',
    ];
    

    public function categories()
    {
        return $this->belongsToMany(Category::class,'place_categories');
    }
    
    public function offers(){
        return $this->hasMany(Offer::class, 'place_id');
    }
    
    public function notifications(){
        return $this->hasMany(Notification::class, 'placeId');
    }
}
