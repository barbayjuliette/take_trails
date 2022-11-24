class Review < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  belongs_to :trail
  has_many_attached :photos
  validates :content, length: { minimum: 10 }, presence: true
  validates :rating, presence: true
end
