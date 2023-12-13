# app/models/medical_history.rb

class MedicalHistory < ApplicationRecord
  # Associations
  belongs_to :patient, primary_key: 'ssn', foreign_key: 'patient_ssn', inverse_of: :medical_histories

  # Validations
  validates :condition_type, presence: true
  validates :condition_name, presence: true
  validates :diagnosis, presence: true
  validates :status, presence: true
  validates :diagnosis_date, presence: true

  # Primary key configuration
  self.primary_key = 'conditionID'
end
