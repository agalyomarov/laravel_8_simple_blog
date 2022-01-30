@extends('layouts.main')
@section('content')
    <main class="blog">
        <div class="container">
            <h1 class="edica-page-title" data-aos="fade-up">Новые посты</h1>
            <section class="featured-posts-section">
                <div class="row">
                    @foreach ($posts as $post)
                        <div class="col-md-4 fetured-post blog-post" data-aos="fade-right">
                            <div class="blog-post-thumbnail-wrapper">
                                <img src="{{ asset('storage/' . $post->preview_image) }}" alt="blog post">
                            </div>
                            <div class="d-flex justify-content-between">
                                <p class="blog-post-category">{{ $post->category->title }}</p>
                                <form action="{{ route('post.like.store', $post->id) }}" method="POST">
                                    @csrf
                                    <span>{{ $post->liked_users_count > 0 ? $post->liked_users_count : '' }}</span>
                                    @auth()
                                        <button type="submit" class="border-0 bg-transparent">
                                            @if (auth()->user()->likedPosts->contains($post->id))
                                                <i class="fas fa-heart"></i>
                                            @else
                                                <i class="far fa-heart"></i>
                                            @endif
                                        </button>
                                    @endauth
                                    @guest()
                                        <i class="far fa-heart"></i>
                                    @endguest
                                </form>
                            </div>
                            <a href="{{ route('post.show', $post->id) }}" class="blog-post-permalink">
                                <h6 class="blog-post-title">{{ $post->title }}</h6>
                            </a>
                        </div>
                    @endforeach
                </div>
                <div class="row">
                    <div class="m-auto">
                        {{ $posts->links() }}
                    </div>
                </div>
            </section>
            @if (count($likedPosts) > 0)
                <div class="row">
                    <div class="col-md-12">
                        <section>
                            <h1 class="edica-page-title" data-aos="fade-up">Популярные посты</h1>
                            <div class="row blog-post-row">
                                {{-- @dd($likedPosts); --}}
                                @foreach ($likedPosts as $post)
                                    <div class="col-md-4 blog-post" data-aos="fade-up">
                                        <div class="blog-post-thumbnail-wrapper">
                                            <img src="{{ asset('storage/' . $post->preview_image) }}" alt="blog post">
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <p class="blog-post-category">{{ $post->category->title }}</p>
                                            <form action="{{ route('post.like.store', $post->id) }}" method="POST">
                                                @csrf
                                                <span>{{ $post->liked_users_count > 0 ? $post->liked_users_count : '' }}</span>
                                                <button type="submit" class="border-0 bg-transparent">
                                                    @if (auth()->user()->likedPosts->contains($post->id))
                                                        <i class="fas fa-heart"></i>
                                                    @else
                                                        <i class="far fa-heart"></i>
                                                    @endif
                                                </button>
                                            </form>
                                        </div>
                                        <a href="{{ route('post.show', $post->id) }}" class="blog-post-permalink">
                                            <h6 class="blog-post-title">{{ $post->title }}</h6>
                                        </a>
                                    </div>
                                @endforeach

                            </div>
                        </section>
                    </div>
                </div>
            @endif
        </div>
    </main>
@endsection
