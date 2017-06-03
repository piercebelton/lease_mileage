Rails.application.routes.draw do
  get 'landing_page/index'

  resources :leases

  devise_for :users
  resources :users do
    get :get_leases
  end

  root 'landing_page#index'

  get '/index' => 'leases#index'

  get '/users' => 'users#show'



end
