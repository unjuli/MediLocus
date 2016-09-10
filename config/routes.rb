Rails.application.routes.draw do
  devise_for :users

  root :to => 'users#index'

  resources :users do
    collection do
      get 'new_request' => 'users#new_request'
      post 'new_request' => 'users#new_request'
      get 'add_address' => 'users#add_address'
      post 'add_address' => 'users#add_address'
    end
  end
end
