<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class FormController extends Controller
{
    public function index(){
        return view('form.form');
    }

    public function phong() {
        return view('form.phong');
    }
}
