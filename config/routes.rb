Rails.application.routes.draw do
  resources :statuses
  resources :lov_statuses
  resources :tokis
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tokis#index'
end
