Rails.application.routes.draw do

  resources :symptoms
  resources :diseases

  resources :home, only: [:index]

  devise_for :admin

  root 'home#index'
end
