class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :uid
      t.string :image
      t.string :password_digest
      t.string :provider
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.attachment :image
      
      t.timestamps
    end
  end
end
