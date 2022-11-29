class Review < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  has_many_attached :photos

  validates :comment, length: { minimum: 10 }, presence: true
  validates :rating, presence: true
end
