class Trail < ApplicationRecord
  has_many :trips

  validates :name, presence: true, uniqueness: true
  validates :difficulty, presence: true, inclusion: { in: %w(Easy Intermediate Difficult)}
  validates :distance, presence: true, numericality: true
  validates :duration, presence: true, numericality: true
  validates :location, presence: true
end
