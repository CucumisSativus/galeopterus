Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  get '/dashboard', to: 'accounts#index', as: :user_dashboard

  resources :organizations
  resources :organization_invitations, only: :create do
    member do
      post :accept
      post :reject
    end
  end
  post '/board_from_organization/:organization_id', to: 'boards#create_from_organization', as: :board_from_organization
  resources :boards
  put '/boards/:id/mark', to: 'boards#mark', as: :board_mark
  resources :lists, only: [:create, :destroy]
  get '/cards/:id/move_to_list/:list_id', to: 'cards#move_to_list', as: :card_move_to_list
  resources :cards, only: [:create, :destroy]
end
