class CreateWalks < ActiveRecord::Migration[5.2]
  def change
    create_table :walks do |t|
      t.string :walker_name
      t.date :date
      t.string :time
      t.integer :length
      t.integer :available_spots
      t.text :notes

      t.timestamps
    end
  end
end
