# config/routes.rb

Rails.application.routes.draw do
    # Root route to the main dashboard
    root 'dashboard#index'
  
    # Resourceful routes for patients
    resources :patients
  
    # Additional routes for the dashboard
    get 'dashboard', to: 'dashboard#index'
  
    # Devise routes for user (doctor) authentication
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords'
    }
  
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
  