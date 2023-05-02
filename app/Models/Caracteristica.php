<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Caracteristica extends Model
{
    use HasFactory;
    protected $fillable = [
        'nombre', 
        'valor'
    ];

    public function productos()
    {
        return $this->belongsToMany(Producto::class, 'prod_carac', 'id_caracteristicas', 'id_producto');
    }
}
