Rails.application.routes.draw do
  devise_for :users

  root :to => 'users#index'

  resources :users do
    collection do
      get 'new_request' => 'users#new_request'
      post 'new_request' => 'users#new_request'
    end
  end
end
