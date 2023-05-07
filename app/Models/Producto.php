<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
//use App\Models\Categoria;

class Producto extends Model
{
    use HasFactory;
    //protected $table = 'vista_productos';

    protected $fillable = [
        'nombre', 
        'marca',
        "codigo",
        "id_categoria",
        "inactive"
    ];
    public function categoria()
    {
       // return $this->belongsTo(Categoria::class,'id_categoria', 'id');
        return $this->belongsTo(Categoria::class,'id_categoria');
    }
   /*
    public function caracteristicas()
    {
        return $this->belongsToMany(Caracteristica::class, 'prod_carac', 'id_producto', 'id_caracteristicas');
    }
    */

    public function detalles()
    {
        return $this->hasMany(ProductDetail::class, 'id_producto');
    }
}
