Rails.application.routes.draw do
  root 'welcome#index'  #Set the splash screen as my root

  devise_for :users
  
  # Patients routes
  resources :patients, only: [:index, :new, :create, :edit, :update, :destroy]

  # Dashboard route
  get 'dashboard', to: 'dashboard#index'
end
