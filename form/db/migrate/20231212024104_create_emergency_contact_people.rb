class CreateEmergencyContactPeople < ActiveRecord::Migration[7.0]
  def change
    create_table :emergency_contact_people, id: false do |t|
      t.string :contact_person_ssn, primary_key: true
      t.string :first_name
      t.string :middle_name
      t.string :last_name

      t.date :dob
      t.integer :age
      t.string :relationship

      t.string :address
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end

    add_reference :emergency_contact_people, :patient, type: :string, foreign_key: { to_table: :patients, primary_key: :ssn }, index: true, on_delete: :cascade
  end
end
