Rails.application.routes.draw do
  get 'sessions/new'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :users
  resources :sessions
  resources :invoices do
    collection { post :import }
  end
  root 'invoices#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
