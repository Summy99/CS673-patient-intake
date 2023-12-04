class AddDetailsToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :address, :string
    add_column :patients, :city, :string
    add_column :patients, :state, :string
    add_column :patients, :zip_code, :string
    add_column :patients, :disability_type, :string
    add_column :patients, :race, :string
    add_column :patients, :ethnicity, :string
  end
end
