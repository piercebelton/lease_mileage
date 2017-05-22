Rails.application.routes.draw do
  devise_for :users
  resources :leases

  root 'leases#index'

  get '/index' => 'leases#index'


end