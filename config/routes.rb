Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

  devise_for :users

  # root :to => 'users#index'
  resources :users do
    collection do
      get 'new_request' => 'users#new_request'
      post 'new_request' => 'users#new_request'
    end
  end

  get 'static_pages/home'

  get 'static_pages/help'
end
