Rails.application.routes.draw do
  resources :leases

  devise_for :users
  resources :users do
    get :get_leases
  end

  root 'leases#index'

  get '/index' => 'leases#index'

  get '/users' => 'users#show'



end
