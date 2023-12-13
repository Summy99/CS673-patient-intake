class Patient < ApplicationRecord
    has_many :contact_numbers, foreign_key: "patient_ssn", primary_key: "ssn", inverse_of: :patient
    has_many :email_addresses, foreign_key: "patient_ssn", primary_key: "ssn", inverse_of: :patient
    has_many :emergency_contact_people, foreign_key: "contact_person_ssn", primary_key: "ssn", inverse_of: :patient
    has_many :medical_histories, foreign_key: "patient_ssn", primary_key: "ssn", inverse_of: :patient
    has_many :treatments, foreign_key: "patient_ssn", primary_key: "ssn", inverse_of: :patient
    has_many :medications, foreign_key: "patient_ssn", primary_key: "ssn", inverse_of: :patient

    # Validations
    accepts_nested_attributes_for :contact_numbers, allow_destroy: true
    accepts_nested_attributes_for :email_addresses, allow_destroy: true

    validate :at_least_one_contact_number
    validate :at_least_one_email_address

    private
    # Custom validation method to ensure at least one contact number for a patient
    def at_least_one_contact_number
        errors.add(:base, 'Patient must have at least one contact number') if contact_numbers.empty?
    end

    # method to ensure at least one email address for a patient
    def at_least_one_email_address
        errors.add(:base, 'Patient must have at least one email address') if email_addresses.empty?
    end
end