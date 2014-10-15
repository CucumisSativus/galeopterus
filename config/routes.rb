Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  get '/dashboard', to: 'accounts#index', as: :user_dashboard

  resources :boards
  resources :lists, only: [:create, :destroy]
  resources :cards, only: [:create, :destroy]
end
