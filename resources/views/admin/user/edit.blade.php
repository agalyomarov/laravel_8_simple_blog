@extends('admin.layouts.main')
@section('content')
    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Категории</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{{ route('admin.main') }}">Главная</a></li>
                            <li class="breadcrumb-item active">Категории</li>
                        </ol>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <form action="{{ route('admin.user.update', $user->id) }}" method="POST">
                            @csrf
                            @method('PATCH')
                            <div class="form-group">
                                <label for="forName">Имя</label>
                                <input type="text" class="form-control" id="forName" placeholder="Введите имя " value="{{ old('first_name', $user->first_name) }}" name="first_name">
                                @error('first_name')
                                    <div class="text-danger">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="forFamily">Фамилия</label>
                                <input type="text" class="form-control" id="forFamily" placeholder="Введите фамилия" value="{{ old('last_name', $user->last_name) }}" name="last_name">
                                @error('last_name')
                                    <div class="text-danger">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="forEmail">Email</label>
                                <input type="email" class="form-control" id="forEmail" placeholder="Введите почта" value="{{ old('email', $user->email) }}" name="email">
                                @error('email')
                                    <div class="text-danger">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <div class="form-group w-25">
                                <label for="forEmail">Рол</label>
                                <select class="form-control" name="role_id">
                                    @foreach ($roles as $role)
                                        <option {{ $user->role->id == $role->id ? 'selected' : '' }} value="{{ $role->id }}">
                                            {{ $role->title }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('role_id')
                                    <div class="text-danger">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <input type="hidden" name="user_id" value="{{ $user->id }}">
                            <button type="submit" class="btn btn-primary">Добавить</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
