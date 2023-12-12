class CreateTreatments < ActiveRecord::Migration[7.0]
  def change
    create_table :treatments, id: false do |t|
      t.string :treatmentID, primary_key: true
      t.string :treatment_type
      t.string :treatment_notes
      t.date :start_date
      t.date :end_date

      t.string :patient_ssn
    end

    add_foreign_key :treatments, :patients, column: :patient_ssn, primary_key: :ssn, on_delete: :cascade
  end
end
