Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "patients_api#index"
  # Defines the root path route ("/")
  resources :patients_api, only: [:index, :create, :show, :destroy, :update]
  # root "articles#index"
  get 'index', to: 'patients_api#index'
  #additional routes for specific actions
end
