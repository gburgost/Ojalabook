Rails.application.routes.draw do
  get 'search_controller/search'

  resources :photos
  get 'perfil/show'
  get 'list_users/show'

  devise_for :users, controllers: { confirmations: 'confirmations' }

  devise_scope :user do 
    get 'registrar', to: 'devise/registrations#new', as: :registrar
    get 'comenzar', to: 'devise/sessions#new', as: :comenzar
    get 'destruir', to: 'devise/sessions#destroy', as: :destruir
  end

  resources :statuses
  get 'timeline', to: 'statuses#index', as: :timeline
  root to: 'statuses#index'

  get 'usuarios', to: 'list_users#show', as: :usuarios

  get ':id', to: 'perfil#show', as: 'perfil'
end
