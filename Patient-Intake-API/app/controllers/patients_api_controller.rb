require 'date'

class PatientsApiController < ApplicationController
    before_action :set_patient, only: [:show, :update, :destroy]

    
    def index #Method that is called when index view is rendered
        @patients = PatientAPI.all
        render json: @patients
    end

    def create # Method that is called when a patient is created
        @patient = PatientAPI.new(patient_params)

        if @patient.save
            render json: @patient, status: :created
        else
            render json: @patient.errors, status: :unprocessable_entity
        end
    end

    def show # Method that is called when show view is rendered
        if @patient
         render json: @patient
        else
            render json: { error: "Patient not found" }, status: :not_found
        end
    end

    def destroy # Method that is called when a patient is deleted
        @patient.destroy
        render json: "Patient deleted successfully!"
        head :no_content
    end

    def update # Method that is called when a patient is updated
        patient = PatientAPI.find(params[:id])
        if @patient.update(patient_params)
            render json: @patient
        else
            render json: @patient.errors, status: :unprocessable_entity
        end
    end

    private
    
    def patient_params
        params.require(:patient).permit(:first_name, :last_name, :dob, :phone_number, :address, :city, :state, :zip_code, :email)
    end

    def set_patient
        @patient = PatientAPI.find_by(id: params[:id])
    end
end