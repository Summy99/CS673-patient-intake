class AddAddressToPatientApIs < ActiveRecord::Migration[7.0]
  def change
    add_column :patient_apis, :address, :string
  end
end
