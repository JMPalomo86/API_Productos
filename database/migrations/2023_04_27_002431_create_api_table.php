<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('categorias', function (Blueprint $table) {
            $table->id();
            $table->string('nombre');
            $table->timestamps();
        });

        Schema::create('caracteristicas', function (Blueprint $table) {
            $table->id();
            $table->string('nombre');
            $table->string('valor');
            $table->timestamps();
        });
        Schema::create('productos', function (Blueprint $table) {
            $table->id();
            $table->string('nombre');
            $table->string('marca');
            $table->integer('codigo')->unique();
            $table->unsignedBigInteger('id_categoria');
            $table->foreign('id_categoria')->references('id')->on('categorias');
            $table->boolean('inactive')->default(false);
            $table->timestamps();
        });
     

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
 
        Schema::dropIfExists('categorias');
        Schema::dropIfExists('caracteristicas');
        Schema::dropIfExists('productos');
    
    }
};
