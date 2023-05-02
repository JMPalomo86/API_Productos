<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductoResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        //return parent::toArray($request);
        /*
        return [
            'id'=> $this->id,
            'nombre'=>  $this->nombre,
            'marca' =>  $this->marca,
            'codigo'=>  $this->codigo,
            'id_categoria'=> $this->id_categoria,
            'categoria' => $this->categoria->nombre,
            'inactive'=> $this->inactive,
            'created_at'=> $this->created_at->format('d-m-Y'),
            'updated_at'=> $this->updated_at->format('d-m-Y')
        ];
        */
        return [
            'id'=> $this->id,
            'nombre'=>  $this->nombre,
            'marca' =>  $this->marca,
            'codigo'=>  $this->codigo,
            'id_categoria'=> $this->id_categoria,
            'categoria' => $this->categoria->nombre,
            'inactive'=> $this->inactive,
            'created_at'=> $this->created_at->format('d-m-Y'),
            'updated_at'=> $this->updated_at->format('d-m-Y'),
            'detalles' => $this->detalles->map(function ($detail) {
                return [
                    'id' => $detail->id,
                    'nombre' => $detail->nombre,
                    'valor' => $detail->valor,
                ];
            }),
        ];


        /*
        return [
            'id'=> $this->id,
            'nombre'=>  $this->nombre,
            'marca' =>  $this->marca,
            'codigo'=>  $this->codigo,
            'id_categoria'=> $this->id_categoria,
            'categoria' => $this->categoria->nombre,
            'inactive'=> $this->inactive,
            'created_at'=> $this->created_at->format('d-m-Y'),
            'updated_at'=> $this->updated_at->format('d-m-Y'),
            'caracteristicas' => $this->whenLoaded('caracteristicas', function () {
                return $this->caracteristicas->map(function ($caracteristica) {
                    return [
                        'id' => $caracteristica->id,
                        'nombre' => $caracteristica->nombre,
                        //'valor' => $caracteristica->pivot->valor
                        'valor' => $caracteristica->valor
                    ];
                });
            })
        ];
    */

    }
}
