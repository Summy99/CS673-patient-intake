# app/controllers/patients_controller.rb

class PatientsController < ApplicationController
    before_action :set_patient, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user! # Ensure user is authenticated for all actions
  
    def index
      @patients = current_user.patients # Fetch patients assigned to the current user (doctor)
    end
  
    def show
      # Show action logic
    end
  
    def new
      @patient = current_user.patients.build # Build a new patient associated with the current user (doctor)
    end
  
    def create
      @patient = current_user.patients.build(patient_params)
  
      if @patient.save
        redirect_to @patient, notice: 'Patient was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      # Edit action logic
    end
  
    def update
      if @patient.update(patient_params)
        redirect_to @patient, notice: 'Patient was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @patient.destroy
      redirect_to patients_url, notice: 'Patient was successfully destroyed.'
    end
  
    private
  
    def set_patient
      @patient = current_user.patients.find(params[:id]) # Fetch the patient associated with the current user (doctor)
    end
  
    def patient_params
      params.require(:patient).permit(:first_name, :middle_name, :last_name, :gender, :dob, :ssn, :phone_number, :address, :city, :state, :zip_code, :disability_type, :race, :ethnicity)
    end
  end
  