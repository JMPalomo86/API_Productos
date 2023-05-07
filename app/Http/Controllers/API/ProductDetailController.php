<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\GuardarProductDetailRequest;
use App\Http\Resources\ProductDetailResource;
use Illuminate\Http\Request;
use App\Models\ProductDetail;

class ProductDetailController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return ProductDetailResource::collection(ProductDetail::all());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(GuardarProductDetailRequest $request)
    {
        //
        return (new ProductDetailResource(ProductDetail::create($request->all())))
                ->additional(['msg'=>'Caracteristica Gurdada Correctamente']);
    }

    /**
     * Display the specified resource.
     */
    public function show(ProductDetail $id)
    {
        //
        return new ProductDetailResource($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ProductDetail $id)
    {
        //
        $id->update($request->all());
        return (new ProductDetailResource($id))
        ->additional(['msg'=>'Caracteristica Actualizada Correctamente']);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ProductDetail $id)
    {
        //
        $id->delete();
        return (new ProductDetailResource($id))
        ->additional(['msg'=>'Caracteristica Eliminada Correctamente']);
    }
}
