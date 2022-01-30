<?php

namespace App\Http\Controllers\Main\Post\Comment;

use App\Http\Controllers\Controller;
use App\Http\Requests\Main\Post\Comment\StoreRequest;
use App\Models\Comment;
use App\Models\Post;

class StoreController extends Controller
{
   public function __invoke(Post $post, StoreRequest $request)
   {
      $data = $request->validated();
      $data['post_id'] = $post->id;
      $data['user_id'] = auth()->user()->id;
      Comment::create($data);
      return redirect()->route('post.show', $post->id);
   }
}