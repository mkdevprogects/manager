Rails.application.routes.draw do
  resources :performed_actions, only: [:index]

  resources :symptoms
  resources :diseases
  resources :clinics
  resources :doctors

  resources :home, only: [:index]

  devise_for :admin

  root 'home#index'
end
