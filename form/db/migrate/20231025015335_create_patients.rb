class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender
      t.date :dob
      t.integer :ssn

      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
