<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\GuargarCaracteristicaRequest;
use App\Http\Requests\ActualizarCaracteristicaRequest;
use Illuminate\Http\Request;
use App\Models\Caracteristica;

class CaracteristicaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        return Caracteristica::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(GuargarCaracteristicaRequest $request)
    {
        //
        Caracteristica::create($request->all());
        return response()->json([
            'res' => true,
            'mensaje' => 'Caracteristica Guardada Correctamente'
        ],200);
    }

    /**
     * Display the specified resource.
     */
    public function show(Caracteristica $id)
    {
        //
        return response()->json([
            'res'=>true,
            'Caracteristica' => $id
        ],200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(ActualizarCaracteristicaRequest $request, Caracteristica $id)
    {
        //
        $id->update($request->all());
        return response()->json([
            'res'=>true,
            'mensaje'=>'Caracteristica Actualizada Correctamente'
        ],200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Caracteristica $id)
    {
        //
        $id->delete();
        return response()->json([
            'res'=>true,
            'mensaje'=>'Caracteristica Eliminada Correctamente'
        ],200);
    }
}
