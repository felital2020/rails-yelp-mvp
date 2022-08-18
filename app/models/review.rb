class Review < ApplicationRecord
  validates :rating, :content, presence: true
  validates :rating, numericality: { only_integer: true, in: 0..5 }
  belongs_to :restaurant
end
