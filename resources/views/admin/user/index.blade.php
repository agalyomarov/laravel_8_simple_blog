@extends('admin.layouts.main')
@section('content')
    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Ползователи</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{{ route('admin.main') }}">Главная</a></li>
                            <li class="breadcrumb-item active">Ползователи</li>
                        </ol>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <a href="{{ route('admin.user.create') }}" class="btn btn-primary">Добавить</a>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body table-responsive p-0">
                                <table class="table table-hover text-nowrap">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>title</th>
                                            <th>role</th>
                                            <th colspan="3" class="text-center">action</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        @foreach ($users as $user)
                                            <tr>
                                                <td>{{ $user->id }}</td>
                                                <td>{{ $user->email }}</td>
                                                <td>{{ $user->role->title }}</td>
                                                <td class="text-center "><a href="{{ route('admin.user.show', $user->id) }}"><i class="far fa-eye text-success"></i></a></td>
                                                <td class="text-center "><a href="{{ route('admin.user.edit', $user->id) }}"><i class="fas fa-pencil-alt"></i></a></td>
                                                <td class="text-center ">
                                                    <form action="{{ route('admin.user.destroy', $user->id) }}" method="POST">
                                                        @csrf
                                                        @method('delete')
                                                        <button type="submit" class="border-0 bg-transparent">
                                                            <i class="fas fa-trash text-danger" role="button"></i>
                                                        </button>
                                                    </form>
                                                </td>
                                            </tr>
                                        @endforeach

                                    </tbody>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
