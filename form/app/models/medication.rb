# app/models/medication.rb

class Medication < ApplicationRecord
  # Associations
  belongs_to :patient, primary_key: 'ssn', foreign_key: 'patient_ssn', inverse_of: :medications

  # Validations
  validates :patient_ssn, presence: true  # Validate the presence of the foreign key
  validates :medicine_name, presence: true
  validates :dosage, presence: true
  validates :frequency, presence: true
  validates :admin_method, presence: true

  self.primary_key = 'medicineID'
end
