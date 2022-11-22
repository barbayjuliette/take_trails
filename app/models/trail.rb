class Trail < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :difficulty, presence: true
  validates :distance, presence: true
  validates :duration, presence: true
  validates :location, presence: true
end
