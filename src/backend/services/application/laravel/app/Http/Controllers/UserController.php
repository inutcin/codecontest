<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;


class UserController extends Controller
{
    //

    public function login_form() : View
    {
        return view( "user.login");
    }

    public function login() : RedirectResponse 
    {
        return redirect(route("login"));
    }
}
