Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :purchases, only: [:index, :new, :create]
  resources :shipments, only: [:index, :new, :create]

end