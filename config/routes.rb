Rails.application.routes.draw do
  root 'dashboard#index'

  devise_for :users

  resources :patients, only: [:index, :new, :create, :edit, :update, :destroy]

  get 'dashboard', to: 'dashboard#index'
end
