# app/models/contact_number.rb

class ContactNumber < ApplicationRecord
  # Associations
  belongs_to :patient, foreign_key: "patient_ssn", primary_key: "ssn", inverse_of: :contact_numbers

  # Validations
  validates :number, presence: true
  validates :patient_ssn, presence: true
  validates_format_of :number, with: /\A\d{10}\z/, message: 'must be a valid United States contact number (10 digits)'

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
