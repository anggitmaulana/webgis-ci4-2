<?php

namespace App\Controllers;

class Home extends BaseController
{
    public function index()
    {
        $data['title'] ="DINAS PERHUBUNGAN KOTA SERANG";
        return view('home/IndexViews', $data);
    }
}
