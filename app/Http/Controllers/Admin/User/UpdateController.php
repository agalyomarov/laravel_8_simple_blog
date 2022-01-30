<?php

namespace App\Http\Controllers\Admin\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\User\UpdateRequest;
use App\Models\Category;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UpdateController extends Controller
{
    public function __invoke(User $user, UpdateRequest $request)
    {
        $data = $request->validated();
        $user->update($data);
        return redirect()->route('admin.user.show', $user->id);
    }
}