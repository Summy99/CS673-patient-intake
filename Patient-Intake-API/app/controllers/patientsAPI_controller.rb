require 'date'

class PatientsAPIController < ApplicationController
    before_action :set_patient, only: [:show, :update, :destroy]

    
    def index #Method that is called when index view is rendered
        @patients = Patient.all
        render json: @patients
    end

    def create # Method that is called when a patient is created
        @patient = Patient.new(patient_params)

        if @patient.save
            render json: @patient, status: :created, location: @patient
        else
            render json: @patient.errors, status: :unprocessable_entity
        end
    end

    def show # Method that is called when show view is rendered
        render json: @patient
    end

    def destroy # Method that is called when a patient is deleted
        @patient.destroy
        render json: "Patient deleted successfully!"
        head :no_content
    end

    def update # Method that is called when a patient is updated
        if @patient.update(patient_params)
            render json: @patient
        else
            render json: @patient.errors, status: :unprocessable_entity
        end
    end

    private
    
    def patient_params
        params.require(:patient).permit(:first_name, :last_name, :date_of_birth, :phone_number, :address, :city, :state, :zip_code)
    end

    def set_patient
        @patient = Patient.find(params[:id])
    end
end
