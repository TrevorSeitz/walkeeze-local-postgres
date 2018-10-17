class CreateDogsWalks < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs_walks do |t|
      t.text :notes
      # should be primary key false?
      # create_table :dogs_walks, :id => false do |t|
      t.belongs_to :dog, index: true
      t.belongs_to :walk, index: true
    end
  end
end
