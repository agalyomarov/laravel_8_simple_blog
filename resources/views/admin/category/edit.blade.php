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
                    <div class="col-12">
                        <form action="{{ route('admin.category.update', $category->id) }}" class="w-25" method="POST">
                            @csrf
                            @method('PATCH')
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Название категории" name="title" value="{{ old('title', $category->title) }}">
                                @error('title')
                                    <div class="text-danger">
                                        Это поле необходимо для заполненеие
                                    </div>
                                @enderror
                            </div>
                            <input type="submit" class="btn btn-primary" value="Изменить">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
