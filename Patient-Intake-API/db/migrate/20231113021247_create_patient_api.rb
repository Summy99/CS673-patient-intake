class CreatePatientApi < ActiveRecord::Migration[7.0]
  def change
    create_table :patient_apis do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender
      t.date :date_of_birth
      t.integer :ssn
      t.string :address
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end

