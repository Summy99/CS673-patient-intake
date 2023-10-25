require 'date'

class PatientsController < ApplicationController

  def index # Method that is called when idex view is rendered
    @patients = Patient.all
  end

  def age(id) # Method that calculates the age of the patient
    now = Date.today
    patient = Patient.find(id)
    age = now.year - patient.dob.year
    age -= 1 if now < Date.new(now.year, patient.dob.month, patient.dob.day)
    return age
  end

  helper_method :age # Makes the age method available to the view
end
