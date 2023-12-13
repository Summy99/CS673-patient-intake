require 'date'

class PatientsController < ApplicationController
  has_many :contact_numbers
  has_many :email_addresses

  accepts_nested_attributes_for :contact_numbers, allow_destroy: true
  accepts_nested_attributes_for :email_addresses, allow_destroy: true

  def index # Method that is called when idex view is rendered
    @patients = Patient.all
  end

  def new # Method that is called when new view is rendered
    @patient = Patient.new
    @patient.contact_numbers.build
    @patient.email_addresses.build
  end

  def create # Method that is called when a patient is created
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to root_path, notice: "Patient created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    redirect_to root_path, notice: "Patient deleted successfully"
  end

  def age(id) # Method that calculates the age of the patient
    now = Date.today
    patient = Patient.find(id)
    #catch Nil value when calculating age, check that patient and patient.dob are not Nil
    if patient && patient.dob
      age = now.year - patient.dob.year
      age -= 1 if now <Date.new(now.year, patient.dob.month, patient.dob.day)
      return age
    else
      return "N/A"
    end
  end

  helper_method :age # Makes the age method available to the view


  private
    def patient_params
      params.require(:patient).permit(:first_name, :middle_name, :last_name, :gender, :dob, :ssn, contact_numbers_attributes: [:number], email_addresses_attributes: [:email])
    end
end