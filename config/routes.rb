Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  get '/dashboard', to: 'accounts#index', as: :user_dashboard

  resources :organizations
  post '/board_from_organization/:organization_id', to: 'boards#create_from_organization', as: :board_from_organization
  resources :boards
  resources :lists, only: [:create, :destroy]
  resources :cards, only: [:create, :destroy]
end
