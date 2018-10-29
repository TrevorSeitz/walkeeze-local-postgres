class Photo < ApplicationRecord
  #Mounts paperclip image
has_attached_file :image, :styles => { :large => "900>", :medium => width = "300>", :thumb => "100>" }
validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
