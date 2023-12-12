class CreateContactNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_numbers do |t|
      t.string :number

      t.string :patient_ssn, null: false

      t.timestamps
    end

    add_foreign_key :contact_numbers, :patients, column: :patient_ssn, primary_key: :ssn, on_delete: :cascade
  end
end
