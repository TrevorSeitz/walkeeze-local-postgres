class DogsWalk < ApplicationRecord
  belongs_to  :dog
  belongs_to :walk

  accepts_nested_attributes_for :walk

  # has_and_belongs_to_many :user
  # has_and_belongs_to_many :walks

end
