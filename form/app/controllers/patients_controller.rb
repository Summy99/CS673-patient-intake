require 'date'

class PatientsController < ApplicationController # Class that inherits from ApplicationController

  def index # Method that is called when idex view is rendered
    @patients = Patient.all
  end

  def new # Method that is called when new view is rendered
    @patient = Patient.new
    @patient.contact_numbers.build
    @patient.email_addresses.build
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.contact_numbers.build unless @patient.contact_numbers.present?
    @patient.email_addresses.build unless @patient.email_addresses.present?

    puts "Form Data: #{params.inspect}"
    if @patient.save
      redirect_to root_path, notice: "Patient created successfully"
    else
      puts @patient.errors.full_messages
      render 'new'
    end
  end


  def show
    @patient = Patient.find_by!(id: params[:id])
  end

  def destroy
    @patient = Patient.find_by!(id: params[:id])
    @patient.destroy

    redirect_to root_path, notice: "Patient deleted successfully"
  end

  def age(dob) # Method that calculates the age of the patient
    return if dob.blank?

    today = Date.today
    age = today.year - dob.year

    # Adjust age based on the month and day
    age -= 1 if today.month < dob.month || (today.month == dob.month && today.day < dob.day)

    age
  end

  helper_method :age # Makes the age method available to the view

  private

  def patient_params
    params.require(:patient).permit(
      :first_name,  :last_name, :gender, :dob, :ssn, :street, :city, :state, :zip_code,
      contact_numbers_attributes: [:number, :_destroy, :id],
      email_addresses_attributes: [:email, :_destroy, :id],

      emergency_contact_people_attributes: [
        :contact_person_ssn, :first_name, :middle_name, :last_name, :dob, :relationship,
        :street, :city, :state, :zip_code,
        aux_contact_numbers_attributes: [:contact_person_ssn, :number, :_destroy],
        aux_email_ids_attributes: [:contact_person_ssn, :email_id, :_destroy]
      ]
    )

  end

end
