<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\GuardarCategoriaRequest;
use App\Http\Resources\CategoriaResource;
use Illuminate\Http\Request;
use App\Models\Categoria;

class CategoriaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        return CategoriaResource::collection(Categoria::all());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(GuardarCategoriaRequest $request)
    {
        //
        return (new CategoriaResource(Categoria::create($request->all())))
                ->additional(['msg'=>'Categoria Gurdada Correctamente']);
    }

    /**
     * Display the specified resource.
     */
    public function show(Categoria $id)
    {
        //
        return new CategoriaResource($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Categoria $id)
    {
        $id->update($request->all());
        return (new CategoriaResource($id))
        ->additional(['msg'=>'Categoria Actualizada Correctamente']);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Categoria $id)
    {
        // Verificar si la categoría tiene productos asociados
/*
        $id->delete();
        return (new CategoriaResource($id))
        ->additional(['msg'=>'Caracteristica Eliminada Correctamente']);
*/

        if ($id->productos()->exists()) {

            /*return response()->json([
            'error' => true,
            'msg' => 'No se puede eliminar la categoría porque está siendo usada por uno o más productos.'
            ], 400);
            */
            return (new CategoriaResource($id))
            ->additional(['msg'=>'No se puede eliminar la categoría porque está siendo usada por uno o más productos.']);
        
        }
        
      /*  if ($id->has('productos')) {
            return response()->json([
                'error' => true,
                'msg' => 'No se puede eliminar la categoría porque está siendo usada por uno o más productos.'
            ], 400);
        }*/
        
        $id->delete();
        
        return (new CategoriaResource($id))
            ->additional(['msg'=>'Categoria Eliminada Correctamente']);
            
    }
}
