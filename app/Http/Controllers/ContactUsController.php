<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ContactUs;

class ContactUsController{
    public function create(){
        return view('admin.contact');
    }

    public function store(Request $request){
        $request->validate([
            'name' => ['required', 'string'],
            'email' => ['required', 'email'],
            'message' => ['required', 'string'],
        ]);

        ContactUs::create($request->all());

        return  redirect()->back()->with('success', 'Query submitted successfully.');
    }
}
