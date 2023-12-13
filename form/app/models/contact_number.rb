# app/models/contact_number.rb

class ContactNumber < ApplicationRecord
  # Associations
  belongs_to :patient, foreign_key: "patient_ssn", primary_key: "ssn"

  # Validations
  validates :number, presence: true
  validates :patient_ssn, presence: true
  validate :at_least_one_contact_number
  validates_format_of :number, with: /\A\d{10}\z/, message: 'must be a valid United States contact number (10 digits)'

  # Custom validation method to ensure at least one contact number for a patient
  def at_least_one_contact_number
    errors.add(:base, 'Patient must have at least one contact number') if patient.contact_numbers.empty?
  end

  # Method to return an array of contact numbers for a given patient SSN
  def self.phone_numbers_for_patient(ssn)
    ContactNumber.joins(:patient).where('patients.ssn' => ssn).pluck(:number)
  end

## Example usage in code
#patient_ssn = '123456789'
#phone_numbers = ContactNumber.phone_numbers_for_patient(patient_ssn)
# If there are multiple phone numbers,iterate through the array
#phone_numbers.each do |phone_number|
 # puts "Phone Number: #{phone_number}"
#end

end
