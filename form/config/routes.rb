Rails.application.routes.draw do
  root "patients#index"

  resources :patients
end
