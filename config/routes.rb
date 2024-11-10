Rails.application.routes.draw do
  root 'dashboard#index'

  devise_for :users

  resources :patients, only: [:index, :new, :create, :edit, :update, :destroy]

  # Defines the root path route ("/")
  # root "articles#index"
end
