class AddWalkerToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :walker, :boolean, default: false
  end
end
