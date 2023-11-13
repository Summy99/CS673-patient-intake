class AddCityStateZipToPatientApIs < ActiveRecord::Migration[7.0]
  def change
    add_column :patient_apis, :city, :string
    add_column :patient_apis, :state, :string
    add_column :patient_apis, :zip_code, :integer
  end
end
