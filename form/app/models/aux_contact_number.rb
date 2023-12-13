# app/models/aux_contact_number.rb

class AuxContactNumber < ApplicationRecord
  # Associations
  belongs_to :emergency_contact_person,
             foreign_key: 'contact_person_ssn',
             primary_key: 'contact_person_ssn',
             inverse_of: :aux_contact_numbers,
             class_name: 'EmergencyContactPerson'  # Specify the class name

  # Validations
  validates :contact_number, presence: true, format: { with: /\A\+?[0-9]{10}\z/, message: "should be a valid 10 digit phone number" }
end
