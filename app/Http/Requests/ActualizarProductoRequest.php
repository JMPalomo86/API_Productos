<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class ActualizarProductoRequest extends FormRequest
{
    
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            //
            'nombre' => 'required',
            'marca' => 'required',
            'codigo' => 'nullable|unique:productos,codigo,'.$this->route('id')->id,
            'id_categoria' => 'required',
            'inactive' => 'required'
        ];
      
    }
}
