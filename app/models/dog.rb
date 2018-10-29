class Dog < ApplicationRecord
  validates :name, :breed, :age, presence: true

  belongs_to :user
  has_many :dogs_walks
  has_many :walks, through: :dogs_walks

  #Mounts paperclip image
has_one_attached :image #, :styles => { :large => "900>", :medium => width = "600>", :small => width = "300>", :thumb => "100>" }
# validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  accepts_nested_attributes_for :dogs_walks

  def current_dog_walk(walk)
    DogsWalk.find_by(dog_id: self.id, walk_id:  walk.id)
  end

  def self.most_walks
    @walk_count = DogsWalk.group("dog_id").order("count_dog_id desc").count("dog_id")
    @dog = Dog.find(@walk_count.keys[0])
  end

end
