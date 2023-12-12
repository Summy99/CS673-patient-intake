class CreateEmailAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :email_addresses do |t|
      t.string :email

      t.string :patient_ssn, null: false

      t.timestamps
    end

    add_foreign_key :email_addresses, :patients, column: :patient_ssn, primary_key: :ssn, on_delete: :cascade
  end
end
