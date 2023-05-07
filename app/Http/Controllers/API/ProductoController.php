<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\GuardarProductoRequest;
use App\Http\Requests\ActualizarProductoRequest;
use App\Http\Resources\ProductoResource;
use Illuminate\Http\Request;
use App\Models\Producto;

class ProductoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $productos = Producto::where('inactive', '=', false)->with('categoria','detalles')->get();
        return ProductoResource::collection($productos);
        /*
        $productos = Producto::where('inactive', '=', false)->with('categoria')->get();
        return ProductoResource::collection($productos);
        */

        //return ProductoResource::collection(Producto::where('inactive', '=', false)->get());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(GuardarProductoRequest $request)
    {
        //
        /*
        Producto::create($request->all());
        return response()->json([
            'res' => true,
            'mensaje' => 'Producto Guardado Correctamente'
        ],200);
        */
        return (new ProductoResource(Producto::create($request->all())))
        ->additional(['msg'=>'Producto Guardado Correctamente']);
    }

    /**
     * Display the specified resource.
     */
    public function show(Producto $id)
    {
        //
        /*
        return response()->json([
            'res'=>true,
            'Producto' => $id
        ],200);
        */
        return new ProductoResource($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(ActualizarProductoRequest $request, Producto $id)
    {
        //
         /*$id->update($request->all());
        return response()->json([
            'res'=>true,
            'mensaje'=>'Producto Actualizado Correctamente'
        ],200);
       */


        $id->update($request->except('codigo'));
        return (new ProductoResource($id))
        ->additional(['msg'=>'Producto Actualizado Correctamente']);

/*
            // Actualizar el producto
    $id->update($request->except('codigo'));

    // Obtener los detalles antiguos y nuevos
    $detallesAntiguos = $id->detalles;
    $nuevosDetalles = $request->input('detalles', []);

    // Eliminar los detalles antiguos que no estén en la lista de nuevos detalles
    foreach ($detallesAntiguos as $detalle) {
        if (!in_array($detalle->id, array_column($nuevosDetalles, 'id'))) {
            $detalle->delete();
        }
    }

    // Agregar los nuevos detalles que no estén en la lista de detalles antiguos
    foreach ($nuevosDetalles as $detalle) {
        if (!in_array($detalle['id'], array_column($detallesAntiguos->toArray(), 'id'))) {
            $id->detalles()->create([
                'nombre' => $detalle['nombre'],
                'valor' => $detalle['valor']
            ]);
        }
    }

    return new ProductoResource($id);
*/
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Producto $id)
    {
        //
        $id->update([
            'inactive' => true,
        ]);
        /*
        $id->delete();
        return response()->json([
            'res'=>true,
            'mensaje'=>'Producto Eliminado Correctamente'
        ],200);*/
        return (new ProductoResource($id))
        ->additional(['msg'=>'Producto Eliminado Correctamente']);

    }
}
