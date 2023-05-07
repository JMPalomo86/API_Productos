<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductDetailResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'nombre' => $this->nombre,
            'valor' => $this->valor,
            'id_producto' => $this->id_producto,
            'created_at'=> $this->created_at->format('d-m-Y'),
            'updated_at'=> $this->updated_at->format('d-m-Y'),
        ];
    }
}
