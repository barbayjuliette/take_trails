class Review < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  has_many :tags, dependent: :destroy
  has_many :categories, through: :tags
  belongs_to :trail
  has_many_attached :photos
  validates :comment, length: { minimum: 10 }, presence: true
  validates :rating, presence: true
end
