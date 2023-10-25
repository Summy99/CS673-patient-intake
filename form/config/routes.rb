Rails.application.routes.draw do
  root "patients#index"

  get "/patientlist", to: "patients#index"
  get "/patients/:id", to: "patients#show"
end
