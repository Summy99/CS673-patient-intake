class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients, id: false do |t|
      t.string :ssn, primary_key: true
      t.string :first_name
      t.string :middle_name
      t.string :last_name

      t.string :gender

      t.string :ethnicity
      t.string :race

      t.date :dob
      t.integer :age

      t.string :address
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end

    add_index :patients, :ssn, unique: true
  end
end
