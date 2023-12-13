# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    private
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute1, :attribute2]) # Add any additional attributes for user sign-up
      devise_parameter_sanitizer.permit(:account_update, keys: [:attribute1, :attribute2]) # Add any additional attributes for user account update
    end
  end  