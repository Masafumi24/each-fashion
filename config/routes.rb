Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :users, only: [:show, :edit]
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
  end
end