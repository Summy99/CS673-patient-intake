class AddFieldsToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :disability_type, :string
    add_column :patients, :goals, :string
  end
end
