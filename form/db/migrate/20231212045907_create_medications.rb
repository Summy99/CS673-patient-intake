
class CreateMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :medications, id: false do |t|
      t.string :medicineID, primary_key: true
      t.string :medicine_name
      t.string :dosage
      t.string :frequency
      t.string :admin_method

      t.string :patient_ssn
    end

    add_foreign_key :medications, :patients, column: :patient_ssn, primary_key: :ssn, on_delete: :cascade
  end
end
