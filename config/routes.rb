# frozen_string_literal: true

Rails.application.routes.draw do

  resources :follows
  root "posts#index"

  devise_for :users
  resources :posts
  resources :favorites
  resources :votes
  resources :replies


end
