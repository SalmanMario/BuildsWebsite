<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function index(){
        if (Auth::check()) {
            $user = Auth::user();
            return new UserResource($user);
        } else {
            return redirect('/admin/login');
        }
    }
}
