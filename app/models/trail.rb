class Trail < ApplicationRecord
  DIFFICULTIES = %w(Easy Intermediate Difficult)
  has_many :trips

  validates :name, presence: true, uniqueness: true
  validates :difficulty, presence: true, inclusion: { in: DIFFICULTIES }
  validates :description, presence: true, length: { minimum: 5 }
  validates :distance, presence: true, numericality: true
  validates :duration, presence: true, numericality: true
  validates :location, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end

# Trail::DIFFICULTIES
