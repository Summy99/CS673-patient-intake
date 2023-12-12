class CreateAuxEmailIds < ActiveRecord::Migration[7.0]
  def change
    create_table :aux_email_ids do |t|
      t.string :email_id
      t.string :contact_person_ssn, null: false

      t.timestamps
    end

    add_foreign_key :aux_email_ids, :emergency_contact_people, column: :contact_person_ssn, primary_key: :contact_person_ssn, on_delete: :cascade
  end
end
