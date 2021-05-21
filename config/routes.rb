# frozen_string_literal: true

Rails.application.routes.draw do


  resources :replies
  root "posts#index"

  devise_for :users
  resources :posts

end
