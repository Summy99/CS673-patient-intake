require 'date'

class PatientsController < ApplicationController

  def index # Method that is called when idex view is rendered
    @patients = Patient.all
  end

  def new # Method that is called when new view is rendered
    @patient = Patient.new
  end

  def create # Method that is called when a patient is created
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def age(id) # Method that calculates the age of the patient
    now = Date.today
    patient = Patient.find(id)
    age = now.year - patient.dob.year
    age -= 1 if now < Date.new(now.year, patient.dob.month, patient.dob.day)
    return age
  end

  helper_method :age # Makes the age method available to the view


  private
    def patient_params
      params.require(:patient).permit(:first_name, :middle_name, :last_name, :gender, :dob, :ssn, :phone_number, :email)
    end
end
