class Patient < ApplicationRecord
    has_many :contact_numbers, foreign_key: "patient_ssn", primary_key: "ssn", inverse_of: :patient
    has_many :email_addresses, foreign_key: "patient_ssn", primary_key: "ssn", inverse_of: :patient
    has_many :emergency_contact_people, foreign_key: "contact_person_ssn", primary_key: "ssn", inverse_of: :patient, dependent: :destroy
    has_many :medical_histories, foreign_key: "patient_ssn", primary_key: "ssn", inverse_of: :patient
    has_many :treatments, foreign_key: "patient_ssn", primary_key: "ssn", inverse_of: :patient
    has_many :medications, foreign_key: "patient_ssn", primary_key: "ssn", inverse_of: :patient

    # Validations
    accepts_nested_attributes_for :contact_numbers, allow_destroy: true
    accepts_nested_attributes_for :email_addresses, allow_destroy: true
    accepts_nested_attributes_for :emergency_contact_people, allow_destroy: true

    validates :ssn, presence: true, uniqueness: true, format: { with: /\A\d{9}\z/, message: "must be 9 digits" }, length: { is: 9 }

    validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :zip_code, presence: true, format: { with: /\A\d{5}\z/, message: "must be 5 digits" }
    validates :disability_type, allow_blank: true, presence: true
    validates :race, allow_blank: true, presence: true

    validates :ethnicity, allow_blank: true, presence: true
    validates :dob, presence: true
    validates :street, presence: true
    validates :city, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :state, presence: true
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
