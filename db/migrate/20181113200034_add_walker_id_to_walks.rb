class AddWalkerIdToWalks < ActiveRecord::Migration[5.2]
  def change
    add_column :walks, :walker_id, :integer
  end
end
