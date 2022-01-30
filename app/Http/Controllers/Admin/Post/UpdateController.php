<?php

namespace App\Http\Controllers\Admin\Post;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Post\UpdateRequest;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class UpdateController extends Controller
{
    public function __invoke(Post $post, UpdateRequest $request)
    {
        $data = $request->validated();
        if (isset($data['preview_image'])) {
            $data['preview_image'] = Storage::disk('public')->put('/images', $data['preview_image']);
            if (Storage::disk('public')->exists($post->preview_image)) {
                Storage::disk('public')->delete($post->preview_image);
            }
        }
        if (isset($data['main_image'])) {
            $data['main_image'] = Storage::disk('public')->put('/images', $data['main_image']);
            if (Storage::disk('public')->exists($post->main_image)) {
                Storage::disk('public')->delete($post->main_image);
            }
        }
        $post->update($data);
        return redirect()->route('admin.post.index');
    }
}