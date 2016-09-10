Rails.application.routes.draw do
  devise_for :users

  root :to => 'users#index'
  get 'static_pages/home'
  get 'static_pages/help'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :users do
    collection do
      get 'new_request' => 'users#new_request'
      post 'new_request' => 'users#new_request'
    end
  end
end
