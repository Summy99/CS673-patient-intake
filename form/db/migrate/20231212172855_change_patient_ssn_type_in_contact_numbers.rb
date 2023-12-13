class ChangePatientSsnTypeInContactNumbers < ActiveRecord::Migration[7.0]
  def change
    change_column :contact_numbers, :patient_ssn, :string
  end
end
