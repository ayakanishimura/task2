Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resource :favorites,only: [:create, :destroy]
    resources :book_comments,only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  root 'homes#top'
  get "home/about" => "homes#about"

  get "/search" => "search#search"

end