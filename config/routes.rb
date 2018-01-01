Rails.application.routes.draw do
  get 'welcome/show'
  root 'welcome#show'
  resources :invoices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
