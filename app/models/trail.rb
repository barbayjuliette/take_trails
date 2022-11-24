class Trail < ApplicationRecord
  has_many :trips
  has_many :reviews, through: :trips

  validates :name, presence: true, uniqueness: true
  validates :difficulty, presence: true, inclusion: { in: %w(Easy Intermediate Difficult)}
  validates :description, presence: true, length: { minimum: 5 }
  validates :distance, presence: true, numericality: true
  validates :duration, presence: true, numericality: true
  validates :location, presence: true

end
