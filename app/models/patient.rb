# app/models/patient.rb

class Patient < ApplicationRecord
    belongs_to :user
  
    validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :ssn, format: { with: /\A\d{3}-\d{2}-\d{4}-\z/, allow_blank: true, message: "must be in the format XXX-XX-XXXX" }
    validates :phone_number, presence: true, length: { minimum: 10, message: "must contain at least 10 numbers" }
    validates :address, presence: true, 
    validates :city, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :state, presence: true,
    validates :zip_code, presence: true, format: { with: /\A\d{5}\z/, message: "must be 5 numbers" }
    validates :disability_type, allow_blank: true
    validates :race, allow_blank: true
    validates :ethnicity, allow_blank: true
  
  end
  
  