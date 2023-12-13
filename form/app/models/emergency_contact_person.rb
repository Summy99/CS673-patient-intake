# app/models/emergency_contact_person.rb

class EmergencyContactPerson < ApplicationRecord
  # Associations
  belongs_to :patient, foreign_key: "contact_person_ssn", primary_key: "ssn"
  has_many :aux_contact_numbers, foreign_key: "contact_person_ssn", primary_key: "contact_person_ssn", dependent: :destroy
  has_many :aux_email_ids, foreign_key: "contact_person_ssn", primary_key: "contact_person_ssn", dependent: :destroy

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :relationship, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true, format: { with: /\A\d{5}\z/, message: "should be a 5-digit ZIP code" }

  validate :at_least_one_email_address
  validate :at_least_one_contact_number

  # Primary key configuration
  self.primary_key = 'contact_person_ssn'

  # Methods for retrieving associated contact numbers and email IDs
  def contact_numbers
    aux_contact_numbers.pluck(:contact_number)
  end

  def email_ids
    aux_email_ids.pluck(:email_id)
  end

  #these can be used as follows
  #contact_person = EmergencyContactPerson.find_by_ssn('example_ssn')
  #contact_person.contact_numbers # Returns an array of contact numbers
  #contact_person.email_ids # Returns an array of email IDs

  private

  def at_least_one_email_address
    errors.add(:base, 'At least one email address is required') if aux_email_ids.empty?
  end

  def at_least_one_contact_number
    errors.add(:base, 'At least one contact number is required') if aux_contact_numbers.empty?
  end

end
