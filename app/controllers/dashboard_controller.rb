class DashboardController < ApplicationController
    def index
        # Fetch the currently logged-in user (doctor)
        @current_user = current_user
        # Fetch the patients assigned to the current user (doctor)
        @patients = @current_user.patients
        # Fetch all the patients if the user is an admin
        @patients = Patient.all if @current_user.admin?
    end
end