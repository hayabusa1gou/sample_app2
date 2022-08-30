Rails.application.routes.draw do

  post 'users/create' => "users#create"
  get 'users/edit' => "users#edit"

  get 'users/new'  => "users#new"
  post 'users/login' => "users#login"
  get 'users/logout' => "users#logout"
  get 'users/login_form' => "users#login_form"

  get 'users/:id' => "users#show"

  
  get 'posts/index' => "posts#index"
  get 'posts/new' => "posts#new"
  get 'posts/:id' => "posts#show"
  post 'posts/create' => "posts#create"
  get 'posts/:id/edit' => "posts#edit"
  post 'posts/update' => "posts#update"
  get 'posts/:id/destroy' => "posts#destroy"

  post "reviews/:id/create" => "reviews#reviews_create"
  get "reviews/:id/destroy" => "reviews#reviews_destroy"

  get "likes/:id/create" => "likes#likes_create"
  get "likes/:id/destroy" => "likes#likes_destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
