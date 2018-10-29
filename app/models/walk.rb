class Walk < ApplicationRecord
  validates :walker_name, :date, :time, :length, :available_spots, presence: true

  has_many :dogs_walks
  has_many :dogs, through: :dogs_walks

  accepts_nested_attributes_for :dogs_walks
end
