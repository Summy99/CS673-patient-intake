class AddIdToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :id, :integer
  end
end