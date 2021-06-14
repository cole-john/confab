# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  resources :posts do
    resources :replies
  end 
  resources :replies do
    resources :replies 
  end
  resources :favorites, only: [:create, :update]
  resources :votes, only: [:create, :update]
  resources :follows, only: [:create, :update]

  # Available CRUD routes: index, show, new, edit, create, update, and destroy
  
  get ":username/following" => "posts#following", as: :following_posts
  get ":username/favorites" => "posts#favorites", as: :favorite_posts

  get "/:username" => "users#show", as: :user

end
