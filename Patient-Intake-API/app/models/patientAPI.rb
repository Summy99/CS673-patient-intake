class PatientAPI < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :dob, presence: true
    validates :phone_number, presence: true
    validates :address, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :zip_code, presence: true
end