<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use App\Models\User;

class Listuser extends User
{
    use HasApiTokens, HasFactory, Notifiable;
    
    protected $table='users';
    
    protected $fillable = [
        'firstName',
        'lastName',
        'email',
        'mobile',
        'password',
        'imagePath',
        'dateOfBirth',
        'otp',
        'provider_id',
        'token',
        'provider_name'
        ];
    
    protected $hidden = [
        'password',
    ];
}
