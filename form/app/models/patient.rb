# app/models/patient.rb

class Patient < ApplicationRecord
  self.primary_key = "ssn"

  # Associations
  has_many :contact_numbers, foreign_key: "patient_ssn", dependent: :destroy
  has_many :email_addresses, foreign_key: "patient_ssn", dependent: :destroy
  has_many :emergency_contact_people, foreign_key: "patient_id", dependent: :destroy
  has_many :medical_histories, foreign_key: "patient_ssn", dependent: :destroy
  has_many :medications, foreign_key: "patient_ssn", dependent: :destroy
  has_many :treatments, foreign_key: "patient_ssn", dependent: :destroy

  # Validations
  validates :ssn, presence: true, uniqueness: true
  validates :first_name, presence: true      #First name, last name are required in the model. Middle name optional.
  validates :last_name, presence: true

  validates :gender, presence: true
  validates :ethnicity, presence: true
  validates :race, presence: true
  validates :dob, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true


  #method to get the full name of the patient
  def full_name
    "#{first_name} #{last_name}"
  end

  # Method to calculate age from date of birth
  def calculate_age
    return if dob.blank?

    today = Date.today
    age = today.year - dob.year

    # Adjust age based on the month and day
    age -= 1 if today.month < dob.month || (today.month == dob.month && today.day < dob.day)

    age
  end

end
