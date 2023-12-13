# app/models/email_address.rb
class EmailAddress < ApplicationRecord
  # Associations
  belongs_to :patient, foreign_key: "patient_ssn", primary_key: "ssn", inverse_of: :email_addresses

  # Validations
  validates :email, presence: true
  validates :patient_ssn, presence: true
  validates_format_of :email, with: /\A\w+@\w+\.com\z/, message: 'must be in the format {alphanumericstring}@{alphanumericstring}.com'



  # Method to return an array of email addresses for a given patient SSN
  def self.email_addresses_for_patient(ssn)
    EmailAddress.joins(:patient).where('patients.ssn' => ssn).pluck(:email)
  end

end
