# app/models/treatment.rb

class Treatment < ApplicationRecord
  # Associations
  belongs_to :patient, primary_key: 'ssn', foreign_key: 'patient_ssn', inverse_of: :treatments

  # Validations
  validates :patient_ssn, presence: true  # Add this line to validate the presence of the foreign key
  validates :treatment_type, presence: true
  validates :treatment_notes, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  self.primary_key = 'treatmentID'
end
