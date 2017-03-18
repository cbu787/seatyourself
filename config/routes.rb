Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'owners/index'

  get 'owners/new'

  get 'owners/create'

  get 'reservations/index'

  get 'reservations/new'

  get 'reservations/create'

  get 'customers/index'

  get 'customers/new'

  get 'customers/create'

  get 'restaurants/index'

  get 'restaurants/show'

  get 'restaurants/new'

  get 'restaurants/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
