class CreateAuxContactNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :aux_contact_numbers do |t|
      t.string :contact_number
      t.string :contact_person_ssn, null: false

      t.timestamps
    end

    add_foreign_key :aux_contact_numbers, :emergency_contact_people, column: :contact_person_ssn, primary_key: :contact_person_ssn, on_delete: :cascade
  end
end
