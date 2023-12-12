class CreateMedicalHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :medical_histories, id: false do |t|
      t.string :conditionID, primary_key: true
      t.string :condition_type
      t.string :condition_name
      t.string :diagnosis
      t.string :status
      t.date :diagnosis_date

      t.timestamps
    end

    add_column :medical_histories, :patient_ssn, :string
    add_foreign_key :medical_histories, :patients, column: :patient_ssn, primary_key: :ssn, on_delete: :cascade
  end
end
