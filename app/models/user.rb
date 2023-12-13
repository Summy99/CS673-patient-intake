# app/models/user.rb

class User < ApplicationRecord
    has_many :patients
  
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
  
    # Additional attribute for admin role
    attribute :admin, :boolean, default: false
  
    # Method to check if a user is an admin
    def admin?
      admin
    end
  
  end
  