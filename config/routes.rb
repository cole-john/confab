# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  resources :posts
  resources :favorites
  resources :votes
  resources :replies
  resources :follows

  get ":username/following" => "posts#following", as: :following_posts
  get ":username/favorites" => "posts#favorites", as: :favorite_posts

  get "/:username" => "users#show", as: :user

end
