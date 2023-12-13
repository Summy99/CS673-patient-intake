# app/models/aux_email_id.rb

class AuxEmailId < ApplicationRecord
  # Associations
  belongs_to :emergency_contact_person,
             foreign_key: 'contact_person_ssn',
             primary_key: 'contact_person_ssn',
             inverse_of: :aux_email_ids,
             class_name: 'EmergencyContactPerson'  # Specify the class name

  # Validations
  validates :email_id, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "should be in a valid email format" }
end
