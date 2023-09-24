Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :shipments, only: [:index, :new, :create, :show]
  end
  resources :payments, only: :index
end