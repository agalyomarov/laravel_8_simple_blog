<?php

namespace App\Http\Controllers\Main\Post;

use App\Http\Controllers\Controller;
use App\Models\Post;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ContactController extends Controller
{
    public function __invoke()
    {
        return view('contact');
    }
}