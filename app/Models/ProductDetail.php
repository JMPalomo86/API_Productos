<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductDetail extends Model
{
    use HasFactory;
    protected $fillable = [
        'id_producto',
        'nombre', 
        'valor'
    ];
/*
    public function productos()
    {
        return $this->belongsToMany(Producto::class, 'id_producto','id');
    }
    */
    public function productos()
    {
        return $this->belongsTo(Producto::class, 'id_producto');
    }
}
