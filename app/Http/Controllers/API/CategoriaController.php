<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
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
        return Categoria::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
        Categoria::create($request->all());
        return response()->json([
            'res' => true,
            'mensaje' => 'Categoria Guardada Correctamente'
        ],200);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $producto)
    {
        //
         //
         return response()->json([
            'res'=>true,
            'Categoria' => $producto
        ],200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
