<?php

namespace App\Http\Controllers\Main\Post;

use App\Http\Controllers\Controller;
use App\Models\Post;
use Illuminate\Http\Request;

class IndexController extends Controller
{
    public function __invoke()
    {
        $posts = Post::orderBy('created_at', 'DESC')->paginate(12);
        $idPosts = $posts->pluck('id');
        $likedPosts = [];
        if (auth()->user()) {
            $likedPosts = Post::withCount('likedUsers')
                ->whereNotIn('id', $idPosts)
                ->orderBy('liked_users_count', 'DESC')
                ->get()
                ->take(6);
        }
        return view('main', compact('posts', 'likedPosts'));
    }
}