Rails.application.routes.draw do
  resources :leases

  root 'leases#index'

  get '/index' => 'leases#index'


end
