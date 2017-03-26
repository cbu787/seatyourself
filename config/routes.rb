Rails.application.routes.draw do
  root 'restaurants#index'

  resources :customers, only: %i(index new create)
  resources :owners, only: %i(new create show)
  resources :restaurants, only: %i(index show new create) do
    resources :reservations, only: %i(index new create)
  end
  resources :sessions, only: %i(new create destroy)

  delete '/sessions/' => 'sessions#destroy', as: 'logout'

  # get 'sessions/new'
  #
  # get 'sessions/create'
  #
  # get 'sessions/destroy'
  #
  # get 'owners/index'
  #
  # get 'owners/new'
  #
  # get 'owners/create'
  #
  # get 'reservations/index'
  #
  # get 'reservations/new'
  #
  # get 'reservations/create'
  #
  # get 'customers/index'
  #
  # get 'customers/new'
  #
  # get 'customers/create'
  #
  # get 'restaurants/index'
  #
  # get 'restaurants/show'
  #
  # get 'restaurants/new'
  #
  # get 'restaurants/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
