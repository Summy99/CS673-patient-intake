Rails.application.routes.draw do
  root "patients#index"

    resources :patients do
      resources :contact_numbers, only: [:index, :create, :destroy]
      resources :email_addresses, only: [:index, :create, :destroy]
      resources :emergency_contact_people, only: [:index, :show, :create, :update, :destroy] do
        resources :aux_contact_numbers, only: [:index, :create, :destroy]
        resources :aux_email_ids, only: [:index, :create, :destroy]
      end
      resources :medical_histories, only: [:index, :create, :update, :destroy]
      resources :medications, only: [:index, :create, :update, :destroy]
      resources :treatments, only: [:index, :create, :update, :destroy]
    end

end
